require 'spec_helper'
require 'rails_helper'

describe Conversation do
  context 'validations' do
    before { FactoryGirl.build(:conversation) }

    it do
      should validate_uniqueness_of(:sender_id).
        scoped_to(:recipient_id).
        case_insensitive
    end
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:mentor) { FactoryGirl.create(:mentor) }
  let(:conversation) { Conversation.new(sender_id: user.id, recipient_id: mentor.id)}
  let(:faulty_convo) { Conversation.new(sender_id: 1, recipient_id: 1)}

  it 'should have both a sender and recipient' do
    expect(conversation).to be_valid
  end

  it 'should not save without a sender' do
    conversation.sender_id = nil
    conversation.save
    expect(conversation).to_not be_valid
  end

  it 'should not save without a recipient' do
    conversation.sender_id = user.id
    conversation.recipient_id = nil
    conversation.save
    expect(conversation).to_not be_valid
  end
end
