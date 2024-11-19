RSpec.describe Types::User do
  include GraphQL::Testing::Helpers.for(DigitalCVSchema)

  subject { described_class }
  let(:user) { create(:user) }

  describe ".full_name" do
    it "returns user's name and surname on the field" do
      full_name = run_graphql_field("User.fullName", user)

      expect(full_name).to eq("#{user.name} #{user.surname}")
    end
  end
end
