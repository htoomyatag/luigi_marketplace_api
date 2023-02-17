module JsonWebToken
	extend ActiveSupport::Concern

    def jwt_encode(payload, exp = 1200.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.read)
    end

    def jwt_decode(token)
      body = JWT.decode(token, Rails.application.credentials.read)[0]
      HashWithIndifferentAccess.new body
    end

 end


