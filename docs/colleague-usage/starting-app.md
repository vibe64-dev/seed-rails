# Start from the Rails Basic app

In an empty project's Preview, choose **Rails · Basic app** and
**Use this starter**. This works on desktop and phone. Successful import adds
the application source and its complete Genesis contracts to the session;
use **Save** to keep that work in the project. Setup and Preview run the
operations declared in the starter's Stack: install the bundle, prepare the
SQLite database and seed the development account.

The home page lists notes and offers a form to add one. **Sign in** accepts
`developer@example.com` with password `developer`. Ask the coding agent for
changes in the conversation; it runs `bin/rails test` to check them.

If setup fails while installing gems, the workspace lacks Ruby, a C compiler
or a native library (such as libyaml) that a locked gem needs; fix the runtime,
then rerun setup. Do not delete `Gemfile.lock` to work around it.

If import reports missing Stack contracts while the destination project is
still empty, the rejected starter needs repair. Migrating that empty project
cannot repair the downloaded starter. Once the starter is corrected, retry
**Use this starter**. Do not add placeholder Stack sections to the destination
merely to suppress the error.

Colleague can explain the choices and offer to apply the selected starter.
Only after your direct request or accepted offer may it apply that exact
configured starter through its existing onboarding action, then recheck the
result. Application source remains in the session for review and **Save**.
