# frozen_string_literal: true

class DigitalCVSchema < GraphQL::Schema
  use GraphQL::Dataloader

  mutation(Types::MutationType)
  query(Types::QueryType)

  rescue_from(ActiveRecord::RecordNotFound) do |_, _, args, _, field|
    raise GraphQL::ExecutionError, "Couldn't find #{field.type.unwrap.graphql_name} with id #{args[:id]}"
  end

  def self.type_error(err, context)
    super
  end

  def self.resolve_type(abstract_type, obj, ctx)
    raise(GraphQL::RequiredImplementationMissingError)
  end

  max_query_string_tokens(5000)
  validate_max_errors(100)
end
