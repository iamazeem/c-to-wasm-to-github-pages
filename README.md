# c-to-wasm-to-github-pages

[![ci](https://github.com/iamazeem/c-to-wasm-to-github-pages/actions/workflows/ci.yml/badge.svg)](https://github.com/iamazeem/c-to-wasm-to-github-pages/actions/workflows/ci.yml)

This is a minimal example of compiling a small C CLI app to WebAssembly using
[emscripten](https://emscripten.org/index.html) (emsdk) and deploying it to
GitHub Pages.

Live GitHub Pages site: <https://iamazeem.github.io/c-to-wasm-to-github-pages/>

Locally built and tested on Ubuntu 22.04 LTS.

## Build and run locally

- Set up [emsdk](https://emscripten.org/docs/getting_started/downloads.html)
- Clone this repo
- Run: `emmake make serve-wasm`
- Open URL <http://localhost:8080/> in browser

See the [CI workflow](.github/workflows/ci.yml) for build/deployment details.

## License

[MIT](LICENSE)
