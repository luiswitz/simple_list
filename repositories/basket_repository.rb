# frozen_string_literal: true

module Repositories
  class BasketRepository
    def initialize(storage:)
      @storage = storage
    end

    def fetch_basket_list(file)
      list = storage.fetch_basket_list(file)
      create_collection(list)
    end

    private

    def create_collection(list)
      items = list.map do |list_item|
        create_entity(list_item)
      end

      Collections::BasketItems.new(items)
    end

    def create_entity(list_item)
      attributes = extract_item_attributes(list_item)

      Entities::BasketItem.new(attributes)
    end

    def extract_item_attributes(item)
      attributes = item.split(' at ')
      extract_product_and_quantity(attributes).merge(price: attributes.last)
    end

    def extract_product_and_quantity(attributes)
      quantity = attributes.first[/\d+/]
      product = attributes.first.gsub(quantity, '').lstrip

      { product: product, quantity: quantity }
    end

    attr_reader :storage
  end
end
