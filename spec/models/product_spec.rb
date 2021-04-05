require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves a valid product" do
      before_count = Product.count
      @product = Product.new
      @category = Category.new
      @category.name = 'Testing'
      @product.name = 'Testing'
      @product.price_cents = 10000
      @product.quantity = 3
      @product.category = @category
      @product.save!
      expect(Product.count).not_to eq(before_count)
    end

    it "should throw an error with no name" do
      @product = Product.new
      @product.name = nil
      @product.price_cents = 10223
      @product.quantity = 5
      @category = Category.new
      @category.name = 'Testing'
      @product.category = @category
      @product.valid?
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

    it "should throw an error with no price" do
      @product = Product.new
      @product.name = "testing"
      @product.price_cents = nil
      @product.quantity = 5
      @category = Category.new
      @category.name = 'Testing'
      @product.category = @category
      @product.valid?
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end


    it "should throw an error with no quantity" do
      @product = Product.new
      @product.name = "testing"
      @product.price_cents = 23232
      @product.quantity = nil
      @category = Category.new
      @category.name = 'Testing'
      @product.category = @category
      @product.valid?
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it "should throw an error with no category" do
      @product = Product.new
      @product.name = "testing"
      @product.price_cents = 23232
      @product.quantity = 23
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end
  end


end
