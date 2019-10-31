# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Repositories::BasketRepository do
  subject do
    described_class.new(storage: storage)
  end

  let(:file) { 'file' }
  let(:storage) { double(:storage) }

  let(:fetch_basket_list) { subject.fetch_basket_list(file) }

  let(:storage_response) do
    [
      '2 product 1 at 12.00',
      '1 product 2 at 1.00'
    ]
  end

  let(:product_1) do
    Entities::BasketItem.new(product: 'product 1', price: 12.00, quantity: 2)
  end

  let(:product_2) do
    Entities::BasketItem.new(product: 'product 2', price: 1.00, quantity: 1)
  end

  describe '#fetch_basket_list' do
    before do
      allow(storage).to receive(:fetch_basket_list)
        .and_return(storage_response)
    end

    let(:expected_collection) do
      Collections::BasketItems.new([product_1, product_2])
    end

    it 'fetchs list from storage' do
      expect(storage).to receive(:fetch_basket_list)

      fetch_basket_list
    end

    it 'returns a collection of basket items' do
      expect(fetch_basket_list).to be_equal_to(expected_collection)
    end
  end
end
