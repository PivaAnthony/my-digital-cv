class Mutations::SignUp < Mutations::BaseMutation
  description "Creates a new User in the database."

  field :bearer_token, String,
        null: true

  argument :attributes, Types::SignUpAttributes,
           required: true

  def resolve(attributes:)
    user = User.create!(attributes.to_h)

    SignJWT.call(user)
  end
end
