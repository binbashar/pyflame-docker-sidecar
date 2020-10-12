[![Docker Stars](https://img.shields.io/docker/stars/inikolaev/pyflame-docker-sidecar.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/inikolaev/pyflame-docker-sidecar.svg)][hub]

[hub]: https://hub.docker.com/r/inikolaev/pyflame-docker-sidecar/

This a sidecar Docker container which can be used to generate flamegraphs for Python applications.
It uses Uber [pyflame](https://github.com/uber/pyflame) library and [flamegraph.pl](https://github.com/brendangregg/FlameGraph/blob/master/flamegraph.pl) script developed by Brendan Gregg.

In order to generate a flamegraph for an application you have to run this container in the same PID namespace as the application container. 
You also have to run it in priveledged mode or with `SYS_ADMIN` and `SYS_PTRACE` capabilities enabled:

```
# Start sidecar container in the same PID namespace as application container
docker run -it \ 
           --rm \ 
           --cap-add SYS_ADMIN \
           --cap-add SYS_PTRACE \
           --pid "container:<name or id of the application container>" \
           inikolaev/pyflame-docker-sidecar \
           ash

# Now you should be able to find the PID of your application and generate a flamegraph for it
pyflame -p <application pid> | flamegraph.pl > flamegraph.svg
```

I'm still figuring out a better way of running it automatically somehow. Raise an issue if you have an idea.

---

# Release Management
### CircleCi PR auto-release job
<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/pyflame-docker-sidecar/master/%40doc/figures/circleci.png" alt="leverage-circleci" width="130"/>
</div>

- [**pipeline-job**](https://app.circleci.com/pipelines/github/binbashar/pyflame-docker-sidecar) (**NOTE:** Will only run after merged PR)
- [**releases**](https://github.com/binbashar/pyflame-docker-sidecar/releases) 
- [**changelog**](https://github.com/binbashar/pyflame-docker-sidecar/blob/master/CHANGELOG.md) 