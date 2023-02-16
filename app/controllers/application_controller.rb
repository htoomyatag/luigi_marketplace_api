class ApplicationController < ActionController::API
 include ActionController::MimeResponds
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected
 def configure_permitted_parameters
 	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :author_pseudonym, :role_id])
 end

end
