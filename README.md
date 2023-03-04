This repository is a monorepo used for testing the built-in `wait-on` function of https://github.com/cypress-io/github-action.

## Angular

See setup details in [docs/angular](docs/angular.md).

### Error condition

Running on GitHub ubuntu-22.04 the log file shows

```text
start server command "npm start"
current working directory "/home/runner/work/gh-action-wait-on/gh-action-wait-on/packages/angular"
waiting on "http://localhost:4200" with timeout of 60 seconds
/usr/local/bin/npm start

> angular@0.0.0 start
> ng serve

- Generating browser application bundles (phase: setup)...
✔ Browser application bundle generation complete.

Initial Chunk Files   | Names         |  Raw Size
vendor.js             | vendor        |   1.71 MB |
polyfills.js          | polyfills     | 314.27 kB |
styles.css, styles.js | styles        | 209.40 kB |
main.js               | main          |  45.98 kB |
runtime.js            | runtime       |   6.51 kB |

| Initial Total |   2.28 MB

Build at: 2023-03-04T17:49:47.255Z - Hash: 8be49ab8ed4252b5 - Time: 10536ms

** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **


✔ Compiled successfully.
http://localhost:4200 timed out on retry 91 of 3, elapsed 90221ms, limit 90000ms
Error: connect ECONNREFUSED 127.0.0.1:4200

```

## Vite

See setup details in [docs/vite](docs/vite.md)

### Error condition

Running on GitHub ubuntu-22.04 the log file shows

```text
start server command "npm start"
current working directory "/home/runner/work/gh-action-wait-on/gh-action-wait-on/packages/vite"
waiting on "http://localhost:5173" with timeout of 60 seconds
/usr/local/bin/npm start

> vite@0.0.0 start
> vite


  VITE v4.1.4  ready in 192 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
http://localhost:5173 timed out on retry 91 of 3, elapsed 90231ms, limit 90000ms
Error: connect ECONNREFUSED 127.0.0.1:5173
```

### Workaround

Replace `npm start` with `npx vite --host`

See Vite documentation Server Options [server.host](https://vitejs.dev/config/server-options.html#server-host).

"Specify which IP addresses the server should listen on. Set this to 0.0.0.0 or true to listen on all addresses, including LAN and public addresses.

This can be set via the CLI using --host 0.0.0.0 or --host."
