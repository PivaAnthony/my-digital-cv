RSpec.describe Resolvers::GetUserResolver do
  describe "#resolve" do
    let(:user) { create(:user) }

    let(:query) do
      <<-GQL
        query ($id: ID!) {
          getUser (id: $id) {
            id name surname email phone birthdate createdAt updatedAt
          }
        }
      GQL
    end

    it "returns a user by it's ID" do
      result = graphql_execute(query, variables: { id: user.id })
      expected_result = deep_camelize_keys(format_timestamps(user.as_json))

      expect(result["data"]["getUser"]).to eq(expected_result)
    end

    it "returns not found error if user does not exist" do
      result = graphql_execute(query, variables: { id: 0 })

      expect(result["errors"][0]["message"]).to eq("Couldn't find User with id 0")
    end
  end
end
