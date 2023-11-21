require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
      @category = Category.create(name: 'Flower')
      @product = Product.create(name: 'Rose', category: @category, quantity: 2, price: 50)
    end

  describe 'Validations' do
    it 'ensures that a product with all four fields set will indeed save successfully' do
      expect(@product.save!).to be true
      expect(@product).to be_valid
    end

    it 'throws an error Name cant be blank without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it 'throws an error Quantity cant be blank without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it 'throws an error Category must exist without a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq "Category must exist"
    end

    it 'throws an error Price cents is not a number without a price' do 
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq "Price cents is not a number"
    end
  end
end
