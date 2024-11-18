def graphql_execute(query_string, variables: {})
  transform_id_to_integer(
    ApiSchema.execute(query_string, variables: variables)
  )
end
