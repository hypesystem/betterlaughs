# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Betterlaughs::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test?
    '2cf39645901002e762e135d0c12fc075dcc7c856aee52fce2298b29ee9ef1262c5818c3b0a2c925b8b8d3c3345a2e84f05e1be2f00b886712319c2dcb800a63d'
else
    ENV['SECRET_TOKEN']
end
