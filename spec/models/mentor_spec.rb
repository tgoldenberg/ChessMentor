require 'spec_helper'
require 'rails_helper'

describe Mentor do
  let(:mentor) { FactoryGirl.create(:mentor) }

  it 'has a valid factory' do
    expect(mentor).to be_valid
  end
  it 'should have type as "mentor"' do
    expect(mentor.type).to eq("Mentor")
  end
  it 'should not save without a name' do
    expect(FactoryGirl.build(:mentor, name: nil)).to_not be_valid
  end
  it 'should not save without an email address' do
    expect(FactoryGirl.build(:mentor, email: nil)).to_not be_valid
  end
  it 'should not save without an official ranking' do
    expect(FactoryGirl.build(:mentor, official_ranking: nil)).to_not be_valid
  end
  it 'should not save without a city' do
    expect(FactoryGirl.build(:mentor, city: nil)).to_not be_valid
  end
  it 'should not save without a country' do
    expect(FactoryGirl.build(:mentor, country: nil)).to_not be_valid
  end
end
