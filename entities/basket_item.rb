# frozen_string_literal: true

module Entities
  class BasketItem
    def initialize(product:, price:, quantity:)
      @product = product
      @price = Float(price)
      @quantity = Integer(quantity)
    end

    def total
      price * quantity
    end

    def food?
      match_product_in_list(FOOD_WORDS)
    end

    def book?
      match_product_in_list(BOOK_WORDS)
    end

    def medical?
      match_product_in_list(MEDICAL_WORDS)
    end

    def imported?
      match_product_in_list(IMPORTED_WORDS)
    end

    BOOK_WORDS = %w[book books].freeze
    FOOD_WORDS = %w[chocolate pizza chocolates].freeze
    MEDICAL_WORDS = ['pills'].freeze
    IMPORTED_WORDS = ['imported'].freeze

    attr_reader :product
    attr_reader :price
    attr_reader :quantity

    private

    def match_product_in_list(list)
      list.each do |word|
        if product.match(/\b#{word}\b/).to_s == word
          return true
        end
      end

      false
    end
  end
end
