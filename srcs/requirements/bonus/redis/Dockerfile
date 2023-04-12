FROM debian:buster

# Update package lists and install Redis
RUN apt-get update && apt-get install -y redis-server php-redis

# Expose Redis port
EXPOSE 6379

COPY ./conf/redis.conf /etc/redis

# Start Redis server with protected mode disabled
CMD ["redis-server", "--protected-mode", "no"]