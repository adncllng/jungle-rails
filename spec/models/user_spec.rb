require 'rails_helper'

RSpec.describe User, type: :model do
  let(:email) { "test@test.com" }
  let(:password) { "Testing123"}
  let(:password_confirmation) { "Testing123"}
  let(:name) { "Terry Bozzio"}
  subject { User.new name: name, password: password, password_confirmation: password_confirmation, email: email }

  describe 'Validations' do
    it 'is valid with valid: name, password, password confirmation and email' do
      expect(subject).to be_valid
    end

    context 'password and password confirmation do not match' do
      let(:password_confirmation) { "Asdfasdf" }
      it 'should report an error' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context 'password is not long enough' do
      let(:password_confirmation) { "123" }
      let(:password) { "123" }
      it 'should report an error' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
      end
    end

    context 'password confirmation is nill' do
      let(:password_confirmation) { nil }
      it 'should report an error' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end
    context 'email is blank' do
      let(:email) { nil }
      it 'should report an error' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'email is not unique' do
      same =  User.new ({name: "asdf", email: "TEST@test.com"})
      it 'should report an error' do
        subject.save
        expect(same).not_to be_valid
        expect(same.errors.full_messages).to include("Email has already been taken")
      end
    end


  end
end


# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required
