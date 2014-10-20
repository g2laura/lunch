require 'spec_helper'

RSpec.describe User do
  it 'verify if the user is an admin' do
    user = FactoryGirl.create :user
    user.admin = true
    user.save

    expect(user.is_admin?).to eq(true)
  end
end