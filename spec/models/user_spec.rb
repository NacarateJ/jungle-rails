require 'rails_helper'

require_relative '../../app/models/user'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
    end

    it 'should save successfully with all fields set' do
      expect(@user.save).to be true
    end

    it 'should not save when password and password_confirmation do not match' do
      @user.password_confirmation = 'different_password'
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'should not save when password is missing' do
      @user.password = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save when password_confirmation is missing' do
      @user.password_confirmation = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should not save when email is not unique (case insensitive)' do
      @user.save
      duplicate_user = User.new(
        email: 'TEST@TEST.COM',
        password: 'another_password',
        password_confirmation: 'another_password',
        first_name: 'Jane',
        last_name: 'Doe'
      )
      expect(duplicate_user.save).to be false
      expect(duplicate_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not save when email is missing' do
      @user.email = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save when first_name is missing' do
      @user.first_name = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not save when last_name is missing' do
      @user.last_name = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should not save when password is too short' do
      @user.password = 'short' # Set a password that's too short
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
