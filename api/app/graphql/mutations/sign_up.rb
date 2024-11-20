class Mutations::SignUp < Mutations::BaseMutation
  description "Creates a new User in the database."

  field :bearer_token, String,
        null: true

  argument :attributes, Types::SignUpAttributes,
           required: true

  def resolve(attributes:)
    user = User.create!(attributes.to_h)

    {
      bearer_token: JWT.encode(
        { user_id: user.id, exp: 1.hour.from_now.to_i },
        Rails.application.credentials.secret_key_base
      )
    }
  end
end
