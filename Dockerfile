FROM  'gitlab/gitlab-ce:latest'

RUN  apt update && echo "postfix postfix/mailname string gitlab.eth.su" | debconf-set-selections && echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections && DEBIAN_FRONTEND=noninteractive apt install postfix -y && update-rc.d postfix enable

#CMD ["/usr/libexec/postfix/master","-c", "/etc/postfix", "-d"]
#ENTRYPOINT /usr/sbin/postmulti -x /usr/sbin/postfix quiet-quick-start
#ENTRYPOINT /etc/init.d/postfix start

#RUN apt update && apt install exim4 -y
#CMD service exim4 start
