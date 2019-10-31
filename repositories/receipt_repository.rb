# frozen_string_literal: true

module Repositories
  class ReceiptRepository
    def initialize(tax_calculator:)
      @tax_calculator = tax_calculator
    end

    def create_receipt(items)
      receipt_items = items.map do |item|
        create_entity(item)
      end

      create_collection(receipt_items)
    end

    private

    def create_entity(item)
      taxes = tax_calculator.calculate(item)

      Entities::ReceiptItem.new(
        product: item.product,
        price: item.price,
        quantity: item.quantity,
        taxes: taxes
      )
    end

    def create_collection(receipt_items)
      Collections::ReceiptItems.new(receipt_items)
    end

    attr_reader :tax_calculator
  end
end
