docker compose up -d

docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

docker logs -f gitlab

