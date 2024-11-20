class Types::User < Types::BaseObject
  field :id, ID,
        null: false,
        description: "ID of the user."

  field :name, String,
        null: false,
        description: "Name of the user."

  field :surname, String,
        null: false,
        description: "Surname of the user."

  field :email, String,
        null: false,
        description: "Email of the user."

  field :phone, String,
        null: true,
        description: "Phone number of the user."

  field :birthdate, GraphQL::Types::ISO8601DateTime,
        null: true,
        description: "Birthdate of the user."

  field :created_at, GraphQL::Types::ISO8601DateTime,
        null: false,
        description: "Timestamp when the user was created."

  field :updated_at, GraphQL::Types::ISO8601DateTime,
        null: false,
        description: "Timestamp when the user was last updated."

  field :full_name, String,
        null: false,
        description: "Full name of the user."

  def full_name
    "#{object.name} #{object.surname}"
  end
end
