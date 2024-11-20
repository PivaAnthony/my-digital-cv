class Mutations::SignIn < Mutations::BaseMutation
  description "Signs a JWT Token for an existent User."

  field :bearer_token, String,
        null: true

  argument :attributes, Types::SignInAttributes,
           required: true

  def resolve(attributes:)
    user = User.find_by!(email: attributes.email).authenticate(attributes.password)

    {
      bearer_token: JWT.encode(
        { user_id: user.id, exp: 1.hour.from_now.to_i },
        Rails.application.credentials.secret_key_base
      )
    }
  end
end
