# require 'spec_helper'
require 'rails_helper'

# RSpec.describe LessonPart, type: :model do
describe LessonPart do
    it "has a valid factory"
    it "is invalid without a firstname"
    it "is invalid without a lastname"
    it "returns a contact's full name as a string"

    # it "is sequential" do
    #   part_first = LessonPart.create! :name => "L1 P1"
    #   part_sec = LessonPart.create! :name => "L1 P2"
    #   expect(part_first.sequence).to eq(1)
    #   expect(part_sec.sequence).to eq(4)
    # end
end


# require 'rails_helper'
#
# describe User do
#
#   context 'validations' do
#     it { should validate_presence_of :email }
#     it { should validate_presence_of :password }
#     it { should validate_confirmation_of :password }
#     it { should validate_uniqueness_of(:email).case_insensitive }
#   end
#
#   context 'associations' do
#     it { should have_many(:access_tokens).dependent(:destroy) }
#   end
#
#   context '#issue_access_token' do
#     it 'creates access token belonging to user' do
#       user = create(:user)
#
#       expect do
#         access_token = user.issue_access_token
#         expect(access_token).to be_persisted
#         expect(access_token.user).to eq user
#         expect(user.access_tokens).to eq [access_token]
#       end.to change { AccessToken.count }.by(1)
#     end
#   end
#
# end
