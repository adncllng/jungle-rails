require 'rails_helper'

RSpec.describe Product, type: :model do
  # @category = Category.new name: "neat stuff"
  let(:name) { 'test widget' }
  let(:price) { 100 }
  let(:quantity) { 20 }
  let(:category) {Category.new name: "neat stuff"}

subject { Product.new name: name, price: price, quantity: quantity, category: category }
  describe 'Validations' do

    it 'is valid with valid: name, price, quantity, and category' do
      expect(subject).to be_valid
    end

    context 'name is blank' do
      let(:name) { nil }
      it 'is not valid with name of nil' do
        expect(subject).not_to be_valid
      end
      it 'reports an error' do
      expect(subject.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'price is blank' do
      let(:price) { nil }
      it 'is not valid with price of nil' do
        expect(subject).not_to be_valid
      end
      it 'reports an error' do
      expect(subject.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'quantity is blank' do
      let(:quantity) { nil }
      it 'is not valid with quantity of nil' do
        expect(subject).not_to be_valid
      end
      it 'reports an error' do
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'category is blank' do
      let(:category) { nil }
      it 'is not valid with category of nil' do
        expect(subject).not_to be_valid
      end
      it 'reports an error' do
      expect(subject.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end


# Each example (it) is run in isolation of others. Therefore each example
# will needs its own @category created and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will
# indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above
