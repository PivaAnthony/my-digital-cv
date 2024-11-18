class Resolvers::GetUserResolver < Resolvers::BaseResolver
  description "Returns a user by it's ID."

  type Types::User, null: false

  argument :id, ID,
           required: true,
           description: "ID of the required user."

  def resolve(id:)
    User.find(id)
  end
end
