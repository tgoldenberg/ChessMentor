require 'spec_helper'
require 'rails_helper'

describe Conversation do
  let(:user) { FactoryGirl.create(:user) }
  let(:mentor) { FactoryGirl.create(:mentor) }
  let(:conversation) { Conversation.new(sender_id: user.id, recipient_id: mentor.id)}

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

  it 'will create an identical conversation' do
    expect(Conversation.new(sender_id: mentor.id, recipient_id: user.id)).to_not be_valid
  end

end

