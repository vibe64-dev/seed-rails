# Stack

## Stack packages

- `genesis-stack`

## Components

- `ruby`
- `rails`
- `sqlite`
- `rails-sqlite`

## Resources

```json genesis-resource
{
  "id": "database",
  "kind": "sqlite",
  "environmentAlternatives": [
    {
      "bindings": {
        "database": "DB_DATABASE"
      },
      "preferred": true
    }
  ]
}
```

## Verification

- Verify `application`: `bin/rails` `test`

## Connected development

- Default package type: `bundler`

## Deployment

- Runtimes: `ruby` `cpp`
- Recreate on restore: `vendor/bundle` `node_modules` `tmp` `log`
- Ready when: `GET` `/up` returns `200`
- Prepare `Use deployment bundle`: `bundle` `config` `set` `--local` `deployment` `true`
- Prepare `Exclude development gems`: `bundle` `config` `set` `--local` `without` `development test`
- Prepare `Install Ruby dependencies`: `bundle` `install`
- Build `Precompile assets`: `bin/rails` `assets:precompile` `RAILS_ENV=production`
- Migrate `Prepare database`: `bin/rails` `db:prepare` `RAILS_ENV=production`
- Serve `Start`: `sh` `-c` `exec bin/rails server -e production -b "$HOST" -p "$PORT"`

## Outputs

### Target `app`: Run Rails app

- Default.
- Mode: `interactive`
- Runtimes: `ruby`
- Run `Develop`: `bin/rails` `server` `-b` `{host}` `-p` `{port}`

#### Presentation

- Kind: `web`
- Preferred port: `3000`
- URL path: `/`
- Ready when: `GET` `/up` returns `200`

## Workspace setup

- Prepare `Install Ruby dependencies` with `ruby` `cpp` when `Gemfile` exists: `bundle` `install`
- Prepare `Install JavaScript dependencies` with `nodejs` if `package.json` exists: `npm` `install`
- Prepare `Prepare database` with `ruby` when `bin/rails` exists: `bin/rails` `db:prepare`
- Prepare `Seed development data` with `ruby` when `bin/rails` exists: `bin/rails` `db:seed`

## Resource estimates

### Output `app`

- Startup typical MiB: `256`
- Startup high MiB: `512`
- Running typical MiB: `256`
- Running high MiB: `512`

### Workspace setup

- Typical MiB: `512`
- High MiB: `1024`
