class UserController < ApplicationController
  respond_to :html, :json

  def index
    @users = User.all
    respond_with(@users)
  end

end
