# Password reset

People who forgot their password choose a new one through an emailed link.

## Sources

- Main: `app/controllers/passwords_controller.rb`
- `app/mailers/passwords_mailer.rb`
- `app/views/passwords/new.html.erb`
- `app/views/passwords/edit.html.erb`
- `app/views/passwords_mailer/reset.html.erb`

## Public contract

Requesting a reset for any email address always reports that instructions were
sent; mail goes only to an existing account. The emailed link carries a
time-limited token. A valid token with matching new passwords updates the
password, ends that account's sessions and returns to sign-in. An invalid or
expired token, or mismatched passwords, changes nothing and explains why.
