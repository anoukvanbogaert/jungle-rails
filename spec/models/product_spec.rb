require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before do 
     @category = Category.new
     @product = Product.new(
       name: "Someone",
       price: 10,
       quantity: 5,
       category: @category
      )
    end

    it 'works when all validation requirements are met' do
      @product.validate
      expect(@product).to be_valid 
    end


    it 'throws error without a name' do
      @product.name = ''
      @product.valid?
        expect(@product.errors.full_messages[0]).to include ("can't be blank")
    end

     it 'throws error without a price' do
       @product.price = ''
       @product.validate
       expect(@product.errors.full_messages[0]).to include ("is not a number")
     end

     it 'throws error without a quantity' do
      @product.quantity = ''
      @product.validate
      expect(@product.errors.full_messages[0]).to include ("can't be blank")   
    end

    it 'throws error without a category' do
      @product.category = nil
      @product.validate
      expect(@product.errors.full_messages[0]).to include ("must exist")
    end
  end
end
