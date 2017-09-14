FROM alpine

RUN apk add -U git coreutils
RUN apk add -U openssh
RUN ssh-keygen -A
RUN mkdir -p /root/.ssh
ADD https://github.com/lalyos.keys /root/.ssh/authorized_keys

CMD /usr/sbin/sshd -D
