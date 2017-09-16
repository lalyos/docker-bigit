Have you ever wondered why your `git clone` takes so long? It might happen that there are hidden
big files burried into the git repository.

To find them, you start searching stackoverflow, and installing some additioal tools.
I wanted to have an easier way. Just a git push to a special repo.

## Usage


### Via cmd.io

If you dont have docker installed locally,

To install the git-receive-pack command to your own cmd.io account:
```
ssh alpha.cmd.io :add git-receive-pack lalyos/bigit
```

Now you can use it by:
```
git push alpha.cmd.io:/tmp/delme


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

