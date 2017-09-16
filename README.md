Have you ever wondered why your `git clone` takes so long? It might happen that there are hidden
big files burried into the git repository.

To find them, you start searching stackoverflow, and installing some additioal tools.
I wanted to have an easier way. Just a git push to a special repo.

## Usage


### Usage with docker

If you have docker installed, this is the most simple way:
```
docker run --rm -v $PWD:$PWD -w $PWD --entrypoint /hooks/pre-receive lalyos/bigit
```

By default you see the top 10 files, if you want to see more use the **BIGIT_TOP** en var:
```
docker run --rm -e BIGIT_TOP=5 -v $PWD:$PWD -w $PWD --entrypoint /hooks/pre-receive lalyos/bigit
```

### Usage with cmd.io

If you dont have docker installed locally, you can use cmd.io which only relies on ssh client.
You can register to cmd.io with your github account at: (https://www.cmd.io)[https://www.cmd.io]. 
Once you are given access to cmd.io, install the git-receive-pack command into your own cmd.io account:
```
ssh alpha.cmd.io :add git-receive-pack lalyos/bigit
```

Now you can use it by:
```
git push alpha.cmd.io:/delme

```


### Usage with git server running in docker 

This scenario will run a git/ssh server inside of a container, and you can **git push** against it.
To make complex commands easier to run, there a couple of **bigit-xxx** bash functions, which you can
install locally

```
eval "$(docker run --rm lalyos/bigit --functions)"
bigit-git-push
```

You can even play with the git hook:
```
bigit-edit-hook
```

If you mess it up and want to start from scratch just restart the git/ssh server:
```
bigit-stop-server
bigit-start-server
```

## tl;dr

Git push to a server is handeled by **git-receive-pack** but you can change tha.
I got the idee from [gliderlabs cmd wiki](https://github.com/gliderlabs/cmd/wiki/GitPush)

## License

MIT

## References:

- https://stackoverflow.com/questions/10622179/how-to-find-identify-large-files-commits-in-git-history#42544963
- https://stackoverflow.com/questions/223678/which-commit-has-this-blob#223890
- https://github.com/rtyley/bfg-repo-cleaner

