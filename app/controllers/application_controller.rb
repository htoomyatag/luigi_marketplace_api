class ApplicationController < ActionController::API
 include ActionController::MimeResponds
 include JsonWebToken
 before_action :authenticate_request

 private
  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin 
       decoded = jwt_decode(header)
       @current_user = User.find(decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
          respond_to do |format|
           format.any(:xml, :json) { render request.format.to_sym => {errors: e.message},status: :unauthorized }
          end
      rescue JWT::DecodeError => e
          respond_to do |format|
           format.any(:xml, :json) { render request.format.to_sym => {errors: e.message},status: :unauthorized }
          end
    end
  end
end

