class Types::User < Types::BaseObject
  field :id, ID,
        null: false

  field :name, String,
        null: false

  field :surname, String,
        null: false

  field :email, String,
        null: false

  field :phone, String,
        null: true

  field :birthdate, GraphQL::Types::ISO8601DateTime,
        null: true

  field :created_at, GraphQL::Types::ISO8601DateTime,
        null: false

  field :updated_at, GraphQL::Types::ISO8601DateTime,
        null: false

  field :full_name, String,
        null: false,
        description: "Full name of the user."

  def full_name
    "#{object.name} #{object.surname}"
  end
end
