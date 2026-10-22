# Notes home

Visitors read recent notes and add new ones without signing in.

## Sources

- Main: `app/controllers/notes_controller.rb`
- `app/models/note.rb`
- `app/views/notes/index.html.erb`
- `app/views/layouts/application.html.erb`
- `config/routes.rb`
- `db/migrate/20261022145748_create_notes.rb`

## Public contract

The root page lists the 50 most recent notes, newest first, and shows a form
for a new note. Submitting the form with the page's authenticity token saves a
note of 1 to 500 characters and redirects to the root page with a confirmation.
A blank or overlong note is not saved; the page is shown again with the error
and status 422. A submission without a valid authenticity token is rejected
without saving.
