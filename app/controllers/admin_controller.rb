class AdminController < ApplicationController
  before_filter :authorized?

  expose(:registered_users) { User.all }

  def users
  end

  def toggleadmin
    @user = User.find(params[:id])
    @user.admin = !@user.admin
    @user.save
    redirect_to admin_users_path
  end

  private
    def authorized?
      if user_signed_in?
        redirect_to root_path unless current_user.admin?
      else
        redirect_to root_path
      end
    end
end
