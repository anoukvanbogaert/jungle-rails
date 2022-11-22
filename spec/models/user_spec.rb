require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    before do 
     @user = User.new(
       name: "Someone",
       email: "someone@something.com",
       password: "password",
       password_confirmation: "password"
      )
    end

    it 'works when all validation requirements are met' do
      @user.validate
      expect(@user).to be_valid 
    end

    it 'throws error if name is blank' do
      @user.name = ''
      @user.validate
      expect(@user.errors.full_messages[0]).to include ("can't be blank") 
    end

    it 'throws error if email is blank' do
      @user.email = ''
      @user.validate
      expect(@user.errors.full_messages[0]).to include ("can't be blank") 
    end

    it 'throws error if password and password_confirmation are blank' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.validate
      expect(@user.errors.full_messages[0]).to include ("Password can't be blank") 
    end

    it 'throws error if password is too short' do
      @user.password = 'pas'
      @user.password_confirmation = 'pas'
      @user.validate
      expect(@user.errors.full_messages[0]).to include ("too short") 
    end

    it 'throws error if email is not unique' do
      @clone1 = User.create(name: "me", email: "someone@something.com", password: "password", password_confirmation: "password")
      @clone2 = User.create(name: "me", email: "someone@something.com", password: "password", password_confirmation: "password")
      expect(@clone2.errors.full_messages).to include ("Email has already been taken") 
    end
  

  end
end
