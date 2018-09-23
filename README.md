# vuilder
This is a Docker container image for develop Vue.js application.

## Usage sample
* Set environment variable and alias like this.
```
export VUILDER_VERSION="2.9.6"
alias npm='docker run -p 8080:8080 --rm -v ${PWD}:/app -it j-un/vuilder:${VUILDER_VERSION} npm'
alias vue='docker run -p 8080:8080 --rm -v ${PWD}:/app -it j-un/vuilder:${VUILDER_VERSION} vue'
```

* Then, container will run with current directory codes, when you'll simply exec vue/npm commands.

## Appendix
* If you want to build container image yourself, set build-arg as `version=<vuilder version>`.
* `vuilder version` is currently the same as vue-cli version :)
```ex.
$ docker build -t j-un/vuilder:2.9.6 --build-arg version=2.9.6 .
```

* If you do not specify build-arg, the latest vue-cli will be installed.
