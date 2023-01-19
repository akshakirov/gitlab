```
export GITLAB_HOME=/srv/gitlab

docker compose up -d

docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

docker logs -f gitlab
```

Get your token on page https://gitlab/admin/runners

```
docker exec -it gitlab-runner gitlab-runner register \
	--non-interactive \
	--url "https://gitlab.eth.su" \
	--clone-url "https://gitlab.eth.su" \
	--registration-token "TOKEN_HERE" \
	--executor "docker" \
	--docker-image ubuntu:22.04 \
	--description "docker-runner"
```
For more information use https://docs.gitlab.com/runner/register/index.html#docker

 


## Setting up a network
```
  docker exec -it gitlab-runner vi /etc/gitlab-runner/config.toml
```
add string at the end of the file
```
    network_mode = "gitlab-network"
```
