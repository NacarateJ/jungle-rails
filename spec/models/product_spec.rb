require 'rails_helper'

require_relative '../../app/models/product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'Succulent')
      @product = Product.new(
        name: 'String-of-pearls',
        price_cents: 12.99,
        quantity: 15,
        category: @category
      )
    end

    it 'should save successfully with all fields set' do
      expect(@product.save).to be true
    end

    it 'should not save when name is nil' do
      @product.name = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save when price is nil' do
      @product.price_cents = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save when quantity is nil' do
      @product.quantity = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save when category is nil' do
      @product.category = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end