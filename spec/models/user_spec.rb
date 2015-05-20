require 'spec_helper'
require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'should be invalid without name' do
    expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end

  it 'should be invalid without email' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

# it 'can sign up'
# it 'can sign in'
# it 'can visit the home page'
# it 'can create/ join games'
# it 'can have conversations and messages'
# it 'can make moves in the game'
# it 'has a name'
end
