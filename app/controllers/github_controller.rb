
class GithubController < ApplicationController


  def create
    client_id     = ENV['github_client_id']
    client_secret = ENV['github_client_secret']
    code = params[:code]
    base_url = "https://github.com/login/oauth/access_token"
    codes = "?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}"
    url = base_url + codes
    response = Faraday.post(url)

    pairs = response.body.split("&")
    response_hash = {}
    pairs.each do |pair|
      key, value = pair.split("=")
      response_hash[key] = value
    end

    token = response_hash["access_token"]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    hash = JSON.parse(oauth_response.body)

    current_user.github_token = token
    current_user.save

    redirect_to dashboard_path

    # TODO move github to new table
    # user_data = {}
    # user_data[:u_id]         = hash["id"]
    # # user_data[:avatar]       = hash["avatar_url"]
    # user_data[:type]         = hash["type"]
    # # user_data[:name]         = hash["name"]
    # user_data[:github_token] = hash["github_token"]

    # current_user.github_account.create(user_data)
    # binding.pry
  end





end
