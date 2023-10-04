# Angular 16 test

## Setup

In directory `packages`:

### Create app

Follow the steps in [Angular: Setting up the local environment and workspace](https://angular.io/guide/setup-local) to create a standard Angular 15 project.

Execute:

```bash
npm install -g @angular/cli
ng new angular16
```
Accept defaults.

### Set up Cypress

```bash
cd angular16
npm install cypress@latest -D
npx cypress open
```

Select E2E Testing > Continue > Chrome > Start E2E Testing in Chrome
Create new spec > Create spec > Okay, run the spec

The spec fails. Add a `tsconfig.json` file in the `cypress` folder according to https://docs.cypress.io/guides/tooling/typescript-support:

```json
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["es5", "dom"],
    "types": ["cypress", "node"]
  },
  "include": ["**/*.ts"]
}
```

Edit
`cypress/e2e/spec.cy.ts` and replace `https://example.cypress.io` by `/` so that the test spec line reads:
```js
    cy.visit('/')
```

Edit
`cypress.config.ts` and add
`baseUrl: 'http://localhost:4200',`
after
`e2e: {`

Execute:

```bash
npm start
```
The following is shown:

```text
** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **
```

In a separate terminal window (in `packages/angular16`) execute:

```bash
npx cypress run
```
and confirm that the Cypress test completes successfully.
