# Sign in and sign out

People with an account start and end a browser session.

## Sources

- Main: `app/controllers/sessions_controller.rb`
- `app/controllers/concerns/authentication.rb`
- `app/models/user.rb`
- `app/models/session.rb`
- `app/models/current.rb`
- `app/views/sessions/new.html.erb`
- `db/seeds.rb`

## Public contract

The sign-in page accepts an email address and password. Valid credentials
create a stored session, set a signed HTTP-only session cookie and redirect to
the page the person originally requested, or home. Invalid credentials redirect
back with an alert and set no cookie. Sign-in attempts are limited to ten per
three minutes. Signing out deletes the stored session and cookie. Every page
shows the signed-in email address or a sign-in link.

Development setup seeds one account idempotently, `developer@example.com` with
password `developer` unless `SEED_USER_EMAIL` or `SEED_USER_PASSWORD` override
them. Other environments receive no seeded account.
