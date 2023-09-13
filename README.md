# Ruby on Rails and Varnish Project with Surrogate Keys

The project utilizes Ruby on Rails as the backend framework to handle dynamic content generation and database interactions. Ruby on Rails provides a robust foundation for creating web applications with flexibility and maintainability.

Varnish Cache is integrated into the application stack to act as a reverse proxy cache. It intercepts incoming requests and caches responses to serve subsequent requests more efficiently. One of the key features of this project is the use of surrogate keys.


## Requirements

Make sure you have the following installed on your system before getting started:

- Ruby [3.2.2]
- Ruby on Rails [7.0]

## Configuration

1. Build the Docker containers:
    ```bash
    docker-compose build
    ```

2. Create and migrate the database:
    ```bash
    docker-compose run web rails db:create
    docker-compose run web rails db:migrate
    ```

3. Start the Docker containers:
    ```bash
    docker-compose up
    ```

The project will be available at http://localhost:3000.

## Benefits

By leveraging Ruby on Rails and Varnish Cache with surrogate keys, this project achieves the following benefits:

- **Enhanced Performance:** The application delivers content to users more quickly, reducing server load and latency.

- **Granular Cache Control:** Surrogate keys ensure that only relevant cache objects are invalidated, minimizing cache churn.

- **Scalability:** The caching layer helps the application scale efficiently, accommodating increased traffic without a linear increase in server resources.

- Improved User Experience: Users experience faster page load times and a responsive web application.

- **Cost Savings:** Reduced server load and optimized resource usage lead to cost savings in hosting and infrastructure.

Overall, this project showcases how the combination of Ruby on Rails and Varnish Cache with surrogate keys can significantly improve the performance and responsiveness of a web application, making it suitable for high-traffic and data-intensive scenarios.
