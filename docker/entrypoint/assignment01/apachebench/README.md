# ApacheBench (ab) - HTTP Benchmarking Tool

Docker image for the `ab` benchmarking tool.

## Build & Run

```bash
docker build -t abench .

# Run with default test
docker run -it abench

# Custom test
docker run -it abench -n 100 -c 10 https://www.google.com/
