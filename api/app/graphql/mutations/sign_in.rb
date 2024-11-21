class Mutations::SignIn < Mutations::BaseMutation
  description "Signs a JWT Token for an existent User."

  field :bearer_token, String,
        null: true

  argument :attributes, Types::SignInAttributes,
           required: true

  def resolve(attributes:)
    user = User.find_by!(email: attributes.email).authenticate(attributes.password)

    SignJWT.call(user)
  end
end
