```
  docker compose up -d

  docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

  docker logs -f gitlab
```

```
  docker exec -it gitlab-runner gitlab-runner register --url "https://gitlab.eth.su" --clone-url "https://gitlab.eth.su"

Runtime platform                                    arch=amd64 os=linux pid=35 revision=6d480948 version=15.7.1
Running in system-mode.                            
                                                   
Enter the GitLab instance URL (for example, https://gitlab.com/):
[https://gitlab.eth.su]: 
Enter the registration token:
L1ifW5FLw5Rxn                                                                                        
Enter a description for the runner:
[c1f6c90496b]: 
Enter tags for the runner (comma-separated):
docker
Enter optional maintenance note for the runner:

WARNING: Support for registration tokens and runner parameters in the 'register' command has been deprecated in GitLab Runner 15.6 and will be replaced with support for authentication tokens. For more information, see https://gitlab.com/gitlab-org/gitlab/-/issues/380872 
Registering runner... succeeded                     runner=dYsp4JrL
Enter an executor: shell, ssh, virtualbox, docker+machine, kubernetes, docker, docker-ssh, parallels, custom, docker-ssh+machine, instance:
[docker, ssh, shell,]: docker
Enter the default Docker image (for example, ruby:2.7):
ubuntu:latest
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
 
Configuration (with the authentication token) was saved in "/etc/gitlab-runner/config.toml" 
```

Setting up a network
```
  docker exec -it gitlab-runner vi /etc/gitlab-runner/config.toml
```
add string at the end of the file
```
    network_mode = "gitlab-network"
```
