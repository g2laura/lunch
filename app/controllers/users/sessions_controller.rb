class Users::SessionsController < Devise::SessionsController
  def create
    super
    current_user.update(office: params[:user][:office])
  end
end