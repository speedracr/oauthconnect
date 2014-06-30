class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    token = auth[:credentials][:token]
    current_user.update_attribute(:token, token)
    byebug
    redirect_to root_path
  end
end