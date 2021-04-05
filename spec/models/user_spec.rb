require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "creates a valid user" do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it "gives an error when passwords do not match" do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password2'
      )
      @user.save
      expect(@user.errors[:password_confirmation]).to be_present
    end

    it "gives an error when two users have the same email" do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save

      @user2 = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'TESTER1@test.CoM',
        password: 'password',
        password_confirmation: 'password'
      )
      @user2.save
      expect(@user2.errors[:email]).to be_present

    end

    it "gives an error when no email is present" do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      expect(@user.errors[:email]).to be_present
    end
    
    it "gives an error when no first name is present" do
      @user = User.new(
        first_name: nil,
        last_name: 'test',
        email: 'testing123@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      expect(@user.errors[:first_name]).to be_present
    end

    it "gives an error when no last name is present" do
      @user = User.new(
        first_name: 'test',
        last_name: nil,
        email: 'testing123@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      expect(@user.errors[:last_name]).to be_present
    end

    it "gives an error when password is less than 5 characters" do
      @user = User.new(
        first_name: 'test',
        last_name: 'tester',
        email: 'testing123@test.com',
        password: 'pw',
        password_confirmation: 'pw'
      )
      @user.save
      expect(@user.errors[:password]).to be_present
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a valid user' do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save

      user = User.authenticate_with_credentials('tester1@test.com', 'password')
      expect(user).not_to be(nil)
    end

    it 'should return nil for an invalid user' do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      user = User.authenticate_with_credentials('tester1@test.com', 'despacito')
      expect(user).to be(nil)
    end

    it 'should validate a user with whitespace around the email' do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save

      user = User.authenticate_with_credentials('  tester1@test.com  ', 'password')
      expect(user).not_to be(nil)
    end

    it 'should validate a user with wrong casing for the email' do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'tester1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save

      user = User.authenticate_with_credentials('TESTER1@test.com', 'password')
      expect(user).not_to be(nil)
    end

    
  end 

end
