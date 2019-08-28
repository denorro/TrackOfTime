require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: 'denorrostallworth@gmail.com', password: 'abcd1234', password_confirmation: 'abcd1234', firstName: 'Denorro', lastName: 'Stallworth')
    end

    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'can not be created without firstname or lastname' do
      @user.firstName = nil
      @user.lastName = nil
      expect(@user).to_not be_valid
    end

  end
end
