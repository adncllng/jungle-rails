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
