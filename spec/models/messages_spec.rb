require 'spec_helper'
require 'rails_helper'

describe Message do

  let(:message) { FactoryGirl.create(:message) }
  it 'should work with all parameters' do
  end

  it 'should not save without sender id' do
    message.sender_id = nil
    expect(message).to_not be_valid
  end

  it 'should not save without a recipient' do
    message.sender_id = 1
    message.recipient_id = nil
    expect(message).to_not be_valid
  end

  it 'should not save without a body' do
    message.body = nil
    expect(message).to_not be_valid
  end
end
