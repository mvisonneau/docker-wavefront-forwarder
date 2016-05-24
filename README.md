# docker-wavefront-forwarder

[![PULLS](https://img.shields.io/docker/pulls/mvisonneau/wavefront-forwarder.svg)](https://hub.docker.com/r/mvisonneau/wavefront-forwarder)
[![BUILD](https://img.shields.io/travis/mvisonneau/docker-wavefront-forwarder/master.svg)](https://travis-ci.org/mvisonneau/docker-wavefront-forwarder)

## Usage

```
docker run -it --rm -e TOKEN=`2aa666da-9958-56dl-a8b8-627c4354131c` mvisonneau/wavefront-forwarder:latest
```

## Build

- Clone this repository and `cd` into it.

```
mkdir -p bin
docker run -it --rm -v $(pwd)/bin:/dist mvisonneau/wavefront-forwarder-builder:latest
docker build -t wavefront-forwarder .
```

## Dependencies

- This container rely on the output of this other one : <a href="https://hub.docker.com/r/mvisonneau/wavefront-forwarder-builder">mvisonneau/wavefront-forwarder-builder</a>

## Credits

- Thanks to <a href="https://github.com/camptocamp">CampToCamp</a> for the inspiration!
