# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Tutorial2::Application.config.secret_key_base = '7437095306e309f3de7b7d5781acf9de51af985cabcf2aa870e1761f4fecc1ee655ad410f294627f304f5215d19f944e0e42ce135b7727bec004cddcd65a414d'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

#SampleApp::Application.config.secret_key_base = secure_token
Tutorial2::Application.config.secret_key_base = secure_token
