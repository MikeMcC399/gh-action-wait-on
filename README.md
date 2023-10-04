# Cypress GitHub Action `wait-on`

Tests and workarounds for `wait-on` of [cypress-io/github-action](https://github.com/cypress-io/github-action).

This repository is a monorepo used for testing the built-in `wait-on` function of https://github.com/cypress-io/github-action against different packages using the default Node.js version on GitHub (currently 18.x). If the `wait-on` parameter is used to wait for a running development server on `localhost` it may fail to discover the server if the server is not listening on both the IPv4 loopback address `127.0.0.1` and the IPv6 loopback address `::1`.

- [workflows](.github/workflows) contain individual tests, with logs in [actions](https://github.com/MikeMcC399/gh-action-wait-on/actions).
- [packages](packages) are each located in their own working-directory.
- [docs](docs) contain setup details used to install the packages.

The table below shows individual workarounds for the generic `wait-on` issue, tested on GitHub `ubuntu-22.04`.

## Summary

| Package                               | Workaround                                         |
| ------------------------------------- | -------------------------------------------------- |
| [Angular 15](#angular-15)             | none needed for `cypress-io/github-action@v6`      |
| [Create React App](#create-react-app) | none needed                                        |
| [Gatsby](#gatsby)                     | none needed for `cypress-io/github-action@v6`  |
| [Next.js](#nextjs)                    | none needed                                        |
| [Vite](#vite)                         | [`start: npx vite --host`](#vite-workaround)       |

## Angular 15

See setup details in [docs/angular15](docs/angular15.md).

### Error condition

Running on GitHub ubuntu-22.04 with the now deprecated `cypress-io/github-action@v5` version, the log file showed:

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

Angular is not listening on the IPv4 loopback address `127.0.0.1`.

### Angular 15 Workaround

Updating to `cypress-io/github-action@v6` which runs on `node20`, instead of calling  `cypress-io/github-action@v5` which runs on `node16`, resolves the issue.

## Create React App

See setup details in [docs/cra](docs/cra.md).

### Start logs

Create React App (cra) does not fail with `wait-on` running on GitHub ubuntu-22.04.

It listens on `127.0.0.1`, which is picked up by `wait-on`.

(It however does not listen on the IPv6 loopback address `::1`, which is a problem for [start-server-and-test](https://github.com/bahmutov/start-server-and-test/).)

```text
start server command "npm start"
current working directory "/home/runner/work/gh-action-wait-on/gh-action-wait-on/packages/cra"
waiting on "http://localhost:3000" with timeout of 60 seconds
/usr/local/bin/npm start

> cra@0.1.0 start
> react-scripts start

(node:1950) [DEP_WEBPACK_DEV_SERVER_ON_AFTER_SETUP_MIDDLEWARE] DeprecationWarning: 'onAfterSetupMiddleware' option is deprecated. Please use the 'setupMiddlewares' option.
(Use `node --trace-deprecation ...` to show where the warning was created)
(node:1950) [DEP_WEBPACK_DEV_SERVER_ON_BEFORE_SETUP_MIDDLEWARE] DeprecationWarning: 'onBeforeSetupMiddleware' option is deprecated. Please use the 'setupMiddlewares' option.
Starting the development server...

Compiled successfully!

You can now view cra in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://10.1.0.45:3000

Note that the development build is not optimized.
To create a production build, use npm run build.

webpack compiled successfully
```

## Gatsby

See setup details in [docs/gatsby](docs/gatsby.md).

### Error condition

Running on GitHub ubuntu-22.04 with the now deprecated `cypress-io/github-action@v5` version, the log file showed:

```text
start server command "npm start"
current working directory "/home/runner/work/gh-action-wait-on/gh-action-wait-on/packages/gatsby"
waiting on "http://localhost:8000" with timeout of 60 seconds
/usr/local/bin/npm start

> gatsby@1.0.0 start
> gatsby develop

success compile gatsby files - 0.711s
success load gatsby config - 0.024s
success load plugins - 0.179s
success onPreInit - 0.000s
success initialize cache - 0.078s
success copy gatsby files - 0.098s
success Compiling Gatsby Functions - 0.261s
success onPreBootstrap - 0.283s
success createSchemaCustomization - 0.001s
success Checking for changed pages - 0.000s
success source and transform nodes - 0.052s
success building schema - 0.149s
success createPages - 0.011s
success createPagesStatefully - 0.051s
info Total nodes: 24, SitePage nodes: 4 (use --verbose for breakdown)
success Checking for changed pages - 0.000s
success write out redirect data - 0.001s
success onPostBootstrap - 0.009s
info bootstrap finished - 3.734s
success onPreExtractQueries - 0.001s
success extract queries from components - 0.119s
success write out requires - 0.004s
⠀
You can now view gatsby in the browser.
⠀
  http://localhost:8000/
⠀
View GraphiQL, an in-browser IDE, to explore your site's data and schema
⠀
  http://localhost:8000/___graphql
⠀
Note that the development build is not optimized.
To create a production build, use gatsby build
⠀
success Building development bundle - 12.345s
success Writing page-data.json and slice-data.json files to public directory - 0.080s - 4/4 49.77/s
http://localhost:8000 timed out on retry 91 of 3, elapsed 90245ms, limit 90000ms
Error: connect ECONNREFUSED 127.0.0.1:8000
```

Gatsby is not listening on the IPv4 loopback address `127.0.0.1`.

### Gatsby Workaround

Updating to `cypress-io/github-action@v6` which runs on `node20`, instead of calling  `cypress-io/github-action@v5` which runs on `node16`, resolves the issue.

## Next.js

See setup details in [docs/nextjs](docs/nextjs).

### Start logs

Next.js does not fail with `wait-on` running on GitHub ubuntu-22.04.

It uses a well-behaved development server which listens on both `127.0.0.1` (IPv4) and on `::1` (IPv6), which is picked up by `wait-on` using `localhost`.

```text
start server command "npm run dev"
current working directory "/home/runner/work/gh-action-wait-on/gh-action-wait-on/packages/nextjs"
waiting on "http://localhost:3000" with timeout of 60 seconds
/usr/local/bin/npm run dev

> nextjs@0.1.0 dev
> next dev

ready - started server on 0.0.0.0:3000, url: http://localhost:3000
Attention: Next.js now collects completely anonymous telemetry regarding usage.
This information is used to shape Next.js' roadmap and prioritize features.
You can learn more, including how to opt-out if you'd not like to participate in this anonymous program, by visiting the following URL:
https://nextjs.org/telemetry

event - compiled client and server successfully in 2.3s (170 modules)
wait  - compiling / (client and server)...
event - compiled client and server successfully in 618 ms (201 modules)
[2128:0305/142302.305883:ERROR:gpu_memory_buffer_support_x11.cc(44)] dri3 extension not supported.
Missing baseUrl in compilerOptions. tsconfig-paths will be skipped
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

Vite is not listening on the IPv4 loopback address `127.0.0.1`.

### Vite Workaround

Replace `npm start` with `npx vite --host`

See Vite documentation Server Options [server.host](https://vitejs.dev/config/server-options.html#server-host).

"Specify which IP addresses the server should listen on. Set this to 0.0.0.0 or true to listen on all addresses, including LAN and public addresses.

This can be set via the CLI using --host 0.0.0.0 or --host."
