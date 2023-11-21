require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        first_name: 'Albert',
        last_name: 'Huang',
        email: 'albert@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    context 'with valid attributes' do
      it 'save successfully' do
        expect(@user).to be_valid
      end
    end

    context 'with missing attibutes' do
      it 'requires a first name' do
        @user.first_name = nil
        expect(@user).to_not be_valid
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it 'requires a last name' do
        @user.last_name = nil
        expect(@user).to_not be_valid
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it 'requires a password' do
        @user.password = nil
        expect(@user).to_not be_valid
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'requires a password confirmation' do
        @user.password_confirmation = nil
        expect(@user).to_not be_valid
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
      end

      it 'requires an email' do
        @user.email = nil
        expect(@user).to_not be_valid
        expect(@user.errors[:email]).to include("can't be blank")
      end
    end

    context 'with invalid attributes' do
      it 'ensure password has a minimum length of 8 characters' do
        @user.password = '123'
        @user.password_confirmation = '123'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to include('Password is too short')
      end

      it 'ensures password and password_confirmation match' do
        @user.password_confirmation = 'PASSWORD'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to include("doesn't match")
      end

      it 'ensures email is unique' do
        @user.save
        new_user = User.new(
          first_name: 'Albert',
          last_name: 'Huang',
          email: 'ALBERT@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(new_user).to_not be_valid
        expect(new_user.errors[:email]).to include('has already been taken')
      end
    end
    describe '.authenticate_with_credentials' do
      before(:each) do
        @user = User.create(
          first_name: 'Albert',
          last_name: 'Huang',
          email: 'albert@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        )
      end

      context 'with valid credentials' do
        it 'returns the user' do
          expect(User.authenticate_with_credentials('albert@gmail.com', 'password')).to eq @user
        end
      end

      context 'with invalid credentials' do
        it 'returns nil with incorrect email' do
          expect(User.authenticate_with_credentials('@gmail.com', 'password')).to eq nil
        end

        it 'returns nil with incorrect password' do
          expect(User.authenticate_with_credentials('albert@gmail.com', '123')).to eq nil
        end

        it 'returns the user with matching email in different cases' do
          expect(User.authenticate_with_credentials('Albert@gmail.com', 'password')).to eq @user
        end

        it 'returns the user with leading/trailing spaces in email' do
          expect(User.authenticate_with_credentials('     albert@gmail.com', 'password')).to eq @user
        end
      end
    end
  end
end
