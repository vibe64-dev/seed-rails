# App Agent Instructions

Use current project context, the Rails version locked in `Gemfile.lock`, and
the official documentation as the source of truth for application work:

- `https://guides.rubyonrails.org/`
- `https://api.rubyonrails.org/`

Follow Rails conventions: models, controllers, views, routes, migrations and
tests stay where Rails expects them. Generate migrations with `bin/rails
generate`, commit them with `db/schema.rb`, and keep `db/seeds.rb` idempotent.
New controllers require a signed-in user unless they call
`allow_unauthenticated_access`; their tests sign in with `sign_in_as`.

Pages start with useful content and actions. Do not add a page header, welcome
heading, or standalone title unless the user asks for one.

Keep changes scoped to the user request and verify behavior with
`bin/rails test` and the running app.
