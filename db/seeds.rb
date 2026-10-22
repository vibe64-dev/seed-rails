# Seeds run on every workspace setup, so every record here is idempotent.

# One development account. Override the email or password through the
# environment; production never receives seeded credentials.
if Rails.env.development?
  User.find_or_create_by!(email_address: ENV.fetch("SEED_USER_EMAIL", "developer@example.com")) do |user|
    user.password = ENV.fetch("SEED_USER_PASSWORD", "developer")
  end
end
