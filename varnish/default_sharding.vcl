vcl 4.1;

import directors;
import xkey;
import std;

backend node1 {
  .host = "node1.varnish";
  .port = "80";
}

backend node2 {
  .host = "node2.varnish";
  .port = "80";
}

backend content {
  .host = "app";
  .port = "3000";
}

# acl purge {
#   "localhost";
#   "172.0.0.0"/8;
# }

sub vcl_init {
  new cluster = directors.hash();
  cluster.add_backend(node1, 1);
  cluster.add_backend(node2, 1);
}

sub vcl_recv {
  set req.backend_hint = cluster.backend(req.url);
  set req.http.X-shard = req.backend_hint;

  if (req.http.X-shard == server.identity) {
    set req.backend_hint = content;
  } else {
    return(pass);
  }
}

sub vcl_synth {
  if (resp.status == 302) {
    set resp.http.Location = req.http.X-redir;
    return (deliver);
  }
}

# sub vcl_recv {
#   set req.backend_hint = cluster.backend(req.url);
#   set req.http.X-shard = req.backend_hint;

#   if (req.http.X-shard == server.identity &&
#       req.http.X-shard + ".varnish" == req.http.Host) {
#     set req.backend_hint = content;
#   } else {
#     set req.http.X-redir = "https://" + req.http.X-shard +
#       ".varnish" + req.url;
#     return(synth(302, "Found"));
#   }
# }

# sub vcl_synth {
#   if (resp.status == 302) {
#     set resp.http.Location = req.http.X-redir;
#     return (deliver);
#   }
# }
# sub vcl_recv {
#   if (req.method == "PURGE") {
#     if (client.ip !~ purge) {
#       return (synth(405, client.ip + " is not allowed to send PURGE requests."));
#     }
#     if(!req.http.x-xkey-purge) {
#       return(synth(400,"x-xkey-purge header missing"));
#     }

#     set req.http.x-purges = xkey.purge(req.http.x-xkey-purge);

#     if (std.integer(req.http.x-purges,0) != 0) {
#       return(synth(200, req.http.x-purges + " objects purged"));
#     } else {
#       return(synth(404, "Key not found"));
#     }
#   }
# }
