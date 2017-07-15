require "spec_helper"
require "pry"

RSpec.describe Simple::Oauth2 do

  let(:client) {
    Simple::Oauth2::Client.new(
      client_id: '4db85a1fb20b4bcdf885aca41feb6629362874d9',
      client_secret: 'a9572b3d1d1620ea997fd841a573c190ecba2395',
      redirect_uri: 'https://protected-springs-96581.herokuapp.com/oauth2/authorize',
      base_uri: 'https://launchpad.37signals.com',
      auth_endpoint: '/authorization/new',
      token_endpoint: '/authorization/token',
      access_token: 'BAhbB0kiAbB7ImNsaWVudF9pZCI6IjRkYjg1YTFmYjIwYjRiY2RmODg1YWNhNDFmZWI2NjI5MzYyODc0ZDkiLCJleHBpcmVzX2F0IjoiMjAxNy0wNi0yMVQwMTo0MzowNloiLCJ1c2VyX2lkcyI6WzMyNDYzMjA1XSwidmVyc2lvbiI6MSwiYXBpX2RlYWRib2x0IjoiZTE3Yzg5YzJkZjE5ODAzNzRkZTk4OWU2NjQwNzI5ZDEifQY6BkVUSXU6CVRpbWUNoVYdwPVfbqwJOg1uYW5vX251bWkCQwI6DW5hbm9fZGVuaQY6DXN1Ym1pY3JvIgdXkDoJem9uZUkiCFVUQwY7AEY=--6f0259e559b7d0f34aa2142ebc48fbaca2ea8bb5',
      refresh_token: 'BAhbB0kiAbB7ImNsaWVudF9pZCI6IjRkYjg1YTFmYjIwYjRiY2RmODg1YWNhNDFmZWI2NjI5MzYyODc0ZDkiLCJleHBpcmVzX2F0IjoiMjAyNy0wNi0wN1QwMTo0MzowNloiLCJ1c2VyX2lkcyI6WzMyNDYzMjA1XSwidmVyc2lvbiI6MSwiYXBpX2RlYWRib2x0IjoiZTE3Yzg5YzJkZjE5ODAzNzRkZTk4OWU2NjQwNzI5ZDEifQY6BkVUSXU6CVRpbWUN4dQfwH5wbqwJOg1uYW5vX251bWlcOg1uYW5vX2RlbmkGOg1zdWJtaWNybyIHCHA6CXpvbmVJIghVVEMGOwBG--87cf7c093868d9513a9fe4ee59ae319e6a61c99f'
    )
  }

  let(:code) { 'verification_code' }

  # rspec ./spec/simple/oauth2_client_spec.rb:22
  it "gets an access token" do
    reply = client.new_access_token
    expect(reply.access_token).not_to be_nil
    expect(reply.expires_in).not_to be_nil
  end

  # rspec ./spec/simple/oauth2_client_spec.rb:27
  it "exchanges a verification code for an access token" do
    reply = client.exchange_for_access_token(code)
    expect(access_token).not_to be_nil
  end
end
