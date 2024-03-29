# Angular 15 test

These steps were correct when Angular 15 was the latest version.

## Setup

In directory `packages`:

### Create app

Follow the steps in [Angular: Setting up the local environment and workspace](https://angular.io/guide/setup-local) to create a standard Angular 15 project.

Execute:

```bash
npm install -g @angular/cli
ng new angular15
```
Accept defaults.

### Set up Cypress

```bash
cd angular15
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

In a separate terminal window (in `packages/angular15`) execute:

```bash
npx cypress run
```
and confirm that the Cypress test completes successfully.
