# Gatsby test

## Setup

In directory `packages`:

### Create app

Follow the steps in [Gatsby: Quick Start](https://www.gatsbyjs.com/docs/quick-start/) to create a standard Gatsby project.

Execute:

```bash
npm init gatsby
```

Sitename: `gatsby`
Accept defaults. No additional features.

```bash
rm -rf gatsby/.git
```

Add file `gatsby/.npmrc` with contents `legacy-peer-deps=true`.

### Set up Cypress

```bash
cd gatsby
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
`baseUrl: 'http://localhost:8000',`
after
`e2e: {`

Execute:

```bash
npm start
```
The following is shown:

```text
You can now view gatsby in the browser.
⠀
  http://localhost:8000/
⠀
View GraphiQL, an in-browser IDE, to explore your site's data and schema
⠀
  http://localhost:8000/___graphql
```

In a separate terminal window (in `packages/gatsby`) execute:

```bash
npx cypress run
```
and confirm that the Cypress test completes successfully.
