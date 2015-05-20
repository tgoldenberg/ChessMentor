require 'spec_helper'
require 'rails_helper'

describe User do
  it 'has a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

# it 'can sign up'
# it 'can sign in'
# it 'can visit the home page'
# it 'can create/ join games'
# it 'can have conversations and messages'
# it 'can make moves in the game'
# it 'has a name'
end
