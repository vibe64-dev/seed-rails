# Rails Basic starter

A small Ruby on Rails 8.1 application: a public notes page whose form saves to
SQLite, email and password sign-in with one development account, password
reset, and ready unit and HTTP-level tests. It was generated with
`rails new` 8.1.4 (SQLite, importmap, Hotwire, Propshaft) and trimmed to what
the app uses; Docker, Kamal, Solid Cache/Queue/Cable, Action Text, Active
Storage, Action Cable and system tests were left out.

## Run locally

Install Ruby 3.2 or newer with Bundler, a C compiler and the libyaml headers
(some locked gems build native extensions), and Git.

```sh
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

Open http://localhost:3000. Sign in as `developer@example.com` with password
`developer`; set `SEED_USER_EMAIL` and `SEED_USER_PASSWORD` before seeding to
choose other development credentials. `DB_DATABASE` chooses the SQLite file
(default `storage/development.sqlite3`); tests always use
`storage/test.sqlite3`.

## Use through Genesis or Vibe64

See [starting the app](docs/colleague-usage/starting-app.md).

Install `genesis-compiler` and `genesis-stack`, run `genesis init` in an empty
Git repository, then choose `official:rails/basic` with
`genesis templates apply`. Vibe64 offers the same starter in the Preview pane.

The starter owns its dependencies and the setup, output, verification and
deployment commands in `genesis/stack.md`, adopted from the `ruby`, `rails`,
`sqlite` and `rails-sqlite` Stack components. Genesis describes those
requirements; Vibe64 runs the declared operations. Workspace setup installs
the bundle, prepares the database and seeds the development account. The app
needs Ruby, a C toolchain for native gems and one SQLite database file; it
needs no credentials file or committed secret. Development generates its own
secret in `tmp/local_secret.txt`; production reads `SECRET_KEY_BASE` from the
deployment environment.

The Stack's memory estimates are initial planning hints for the Rails server
and workspace setup, not measured requirements or memory limits.

## Check changes

```sh
bin/rails test
```

Model tests check note validation and ordering. Integration tests drive the
real HTTP stack: the home page and form, saving and rejecting notes, the
authenticity-token check on posts, sign-in, sign-out and password reset.

## Development behind a proxy

`config/environments/development.rb` allows any host and drops
`X-Frame-Options`, because the development server binds loopback only and is
viewed through a development reverse proxy, possibly inside a frame.
Production keeps Rails' defaults, forces SSL and expects `SECRET_KEY_BASE` and
an optional persistent `DB_DATABASE`.

## Keep dependencies current

`bundle install` installs the reviewed versions in `Gemfile.lock`. Update
deliberately with `bundle update rails` (or a named gem), run the tests, and
commit both `Gemfile` and `Gemfile.lock`. Compare the Rails upgrade guide with
the application's configuration when moving to a new Rails minor version.
