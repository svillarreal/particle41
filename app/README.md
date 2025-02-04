# particle41 - app

## Description

This is a TypeScript + NodeJS app that uses Express library to expose a REST API that serves the current time in ISO format, as well as the IP address. This app is Dockerized since it is expected to run in a Kubernetes cluster (under AWS EKS). See `Dockerfile` for more details. 

## Request Example

curl --location 'http://localhost:3000/api/time'

## Output Example

{
"timestamp": "2025-02-04T01:08:24.856Z",
"ip": "::ffff:10.0.2.233"
}

## Build

npm install
npm build

## Tests

npm test

## Lint

npm run lint
npm run lint:fix

## Audit

npm audit

## Run Locally

npm start