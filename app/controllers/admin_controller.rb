class AdminController < ApplicationController
  before_filter :authorized?

  def users
    @users = User.all
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
