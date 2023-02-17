class AuthenticationController < ApplicationController
	skip_before_action :authenticate_request
	def login
		@user = User.find_by(username: params[:username])
		respond_to do |format|
			if @user&.authenticate(params[:password])
				token = jwt_encode(user_id: @user.id)
				format.any(:xml, :json) { render request.format.to_sym => {token: token},status: :ok }
			else
				format.any(:xml, :json) { render request.format.to_sym => {error: 'unauthorized'},status: :unauthorized }
			end
		end
	end
end
