# Create react app test

## Setup

In directory `packages`:

### Create app

Follow the steps in [Create React App: Quick Overview](https://github.com/facebook/create-react-app/blob/main/README.md#quick-overview) to create a standard React App project.

Execute:

```bash
npx create-react-app cra
```

### Set up Cypress

```bash
cd cra
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
`cypress.config.js` and add
`baseUrl: 'http://localhost:3000',`
after
`e2e: {`

Execute:

```bash
npm start
```
The following is shown:

```text
You can now view cra in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://192.168.202.1:3000
```

In a separate terminal window (in `packages/cra`) execute:

```bash
npx cypress run
```
and confirm that the Cypress test completes successfully.
