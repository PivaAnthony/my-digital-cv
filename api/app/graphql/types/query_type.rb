# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :get_user, resolver: Resolvers::GetUserResolver
  end
end
