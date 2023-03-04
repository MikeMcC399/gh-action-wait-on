# Vite test

## Setup

In directory `packages`:

### Create app

Follow the steps in [Vite: Getting Started](https://vitejs.dev/guide/) to create a standard Angular 15 project.

Execute:

```bash
npm create vite
```
Project name `vite`
Accept other defaults.

### Set up Cypress

```bash
cd vite
npm install cypress@latest -D
npx cypress open
```
Select E2E Testing > Continue > Chrome > Start E2E Testing in Chrome
Create new spec > Create spec > Okay, run the spec

Edit
`cypress/e2e/spec.cy.ts` and replace `https://example.cypress.io` by `/` so that the test spec line reads:
```js
    cy.visit('/')
```

Edit
`cypress.config.ts` and add
`baseUrl: 'http://localhost:5173',`
after
`e2e: {`

Execute:

```bash
npm run dev
```
The following is shown:

```text
  VITE v4.1.4  ready in 200 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h to show help
```

In a separate terminal window (in `packages/vite`) execute:

```bash
npx cypress run
```
and confirm that the Cypress test completes successfully.
