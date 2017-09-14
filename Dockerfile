FROM alpine

RUN apk add -U git coreutils
RUN apk add -U openssh
RUN ssh-keygen -A

COPY ./git-receive /bin/git-receive
COPY ./pre-receive /hooks/

ENTRYPOINT ["/bin/git-receive"]
