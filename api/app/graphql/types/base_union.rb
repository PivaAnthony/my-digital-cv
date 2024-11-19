# frozen_string_literal: true

module Types
  class BaseUnion < GraphQL::Schema::Union
    connection_type_class(Types::BaseConnection)
  end
end
