class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #devise
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      receipts_url
    else
      super
    end
  end
  
  #declarative_authorization
  def permission_denied
    flash[:error] = "Sorry, you not allowed to access that page."
    redirect_to new_user_session_url
  end
  
end
