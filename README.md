# Gitlab Community Edition latest + runner + MTA (exim)

## Install
```
git clone git@github.com:akshakirov/gitlab-install.git

cd gitlab-install

export GITLAB_HOME=/srv/gitlab

docker compose up -d
```

## Get the root pass
```
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

## Watch an installation process in logs
```
docker logs -f gitlab
```

## Registering runner
Get your token on page https://gitlab.test.com/admin/runners

```
docker exec -it gitlab-runner gitlab-runner register \
	--non-interactive \
	--url "https://gitlab.test.com" \
	--clone-url "https://gitlab.test.com" \
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

# Update
To upgrade GitLab that was installed using Docker Compose:

    Take a backup. As a minimum, back up the database and the GitLab secrets file.
```
docker exec -t <container name> gitlab-backup create
```
As a minimum, back up the database and the GitLab secrets file.
```
docker exec -t <container name> gitlab-backup create SKIP=artifacts,repositories,registry,uploads,builds,pages,lfs,packages,terraform_state
```

Download the newest release and upgrade your GitLab instance:
```
docker compose pull
docker compose up -d
```

If you have used tags instead, you'll need to first edit docker-compose.yml.
