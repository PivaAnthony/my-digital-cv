class SignJWT < ApplicationService
  def initialize(user)
    @user = user
  end

  def call
    OpenStruct.new(
      bearer_token: JWT.encode(payload, Rails.application.secret_key_base)
    )
  end

  private

  def payload
    OpenStruct.new(
      user_id: @user.id,
      exp: 6.hours.from_now.to_i
    ).to_h
  end
end
