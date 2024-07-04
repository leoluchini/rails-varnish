vcl 4.1;

import xkey;
import std;

backend default {
  .host = "host.docker.internal";
  .port = "3000";
}

acl purge {
  "localhost";
  "172.0.0.0"/8;
  "192.0.0.0"/8;
}

sub vcl_recv {
  if (req.method == "PURGE") {
    if (client.ip !~ purge) {
      return (synth(405, client.ip + " is not allowed to send PURGE requests."));
    }
    if(!req.http.x-xkey-purge) {
      return(synth(400,"x-xkey-purge header missing"));
    }

    set req.http.x-purges = xkey.purge(req.http.x-xkey-purge);

    if (std.integer(req.http.x-purges,0) != 0) {
      return(synth(200, req.http.x-purges + " objects purged"));
    } else {
      return(synth(404, "Key not found"));
    }
  }
}

sub vcl_backend_response {
  set beresp.do_esi = true; // Do ESI processing
  set beresp.ttl = 5m;
}
