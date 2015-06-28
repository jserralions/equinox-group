class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 private
   def user_not_authorized(exception)
     policy_name = exception.policy.class.to_s.underscore

     flash[:warning] = t "#{policy_name}.#{exception.query}", scope: "pundit"
     redirect_to(request.referrer || root_path)
   end
end
