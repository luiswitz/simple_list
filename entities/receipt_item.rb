# frozen_string_literal: true

module Entities
  class ReceiptItem
    def initialize(price:, product:, quantity:, taxes:)
      @price = Float(price)
      @product = product
      @quantity = Integer(quantity)
      @taxes = Float(taxes)
    end

    def total
      (price * quantity) + (taxes * quantity)
    end

    attr_reader :price
    attr_reader :product
    attr_reader :quantity
    attr_reader :taxes
  end
end
