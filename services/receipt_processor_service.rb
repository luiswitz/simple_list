# frozen_string_literal: true

module Services
  class ReceiptProcessorService
    def initialize(basket_repository:, receipt_repository:)
      @basket_repository = basket_repository
      @receipt_repository = receipt_repository
    end

    def process(basket_list)
      basket_items_collection = basket_repository.fetch_basket_list(basket_list)
      receipt_items_collection = receipt_repository.create_receipt(basket_items_collection)

      items = process_items(receipt_items_collection)
      taxes = process_taxes(receipt_items_collection)
      total = process_total(receipt_items_collection)

      Receipt.new(items: items, taxes: taxes, total: total)
    end

    private

    def process_items(collection)
      collection.map do |item|
        "#{item.quantity} #{item.product} #{format('%.2f', item.total)}"
      end
    end

    def process_taxes(collection)
      taxes = 0.0
      collection.each { |item| taxes += item.taxes * item.quantity }
      taxes
    end

    def process_total(collection)
      total = 0.0
      collection.each { |item| total += item.total }
      total
    end

    attr_reader :basket_repository
    attr_reader :receipt_repository
  end
end
