# Subsystems

## `application` Notes application

Owns the whole server-rendered application: the public notes home with its
add-note form, email and password sign-in with password reset, the shared page
layout that shows the signed-in account, and the service health check. Notes,
accounts and sign-in sessions are stored in the application's SQLite database.

### Source

- Directory `.`

### Program

- `genesis/program/application/notes.md`
- `genesis/program/application/sign-in.md`
- `genesis/program/application/password-reset.md`
- `genesis/program/application/health.md`

### Data owned

- Table `database` `default` `notes`
- Table `database` `default` `users`
- Table `database` `default` `sessions`

### Data used

- Nothing.
