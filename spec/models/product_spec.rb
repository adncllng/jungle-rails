require 'rails_helper'

RSpec.describe Product, type: :model do
  # @category = Category.new name: "neat stuff"

  describe 'Validations' do

    let(:name) { 'test widget' }
    let(:price) { 100 }
    let(:quantity) { 20 }
    let(:category) {Category.new name: "neat stuff"}

    subject { Product.new name: name, price: price, quantity: quantity, category: category }
    it 'is valid with valid: name, price, quantity, and category' do
      expect(subject).to be_valid
    end

    context 'name is blank' do
      let(:name) { nil }
      it 'it reports an error with name of nil' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'price is blank' do
      let(:price) { nil }
      it 'it reports an error with price of nil' do
        expect(subject).not_to be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end
    end

    context 'quantity is blank' do
      let(:quantity) { nil }
      it 'it reports an error with quantity of nil' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'category is blank' do
      let(:category) { nil }
      it 'it reports an error with category of nil' do
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
