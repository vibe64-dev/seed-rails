# Service health

Lets operators and hosts determine whether the application can serve requests.

## Sources

- Main: `config/routes.rb`

## Public contract

`GET /up` accepts no input and returns 200 when the application booted without
exceptions, otherwise 500. It needs no account and has no side effects.
