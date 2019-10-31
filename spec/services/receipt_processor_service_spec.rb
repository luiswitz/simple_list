# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Services::ReceiptProcessorService do
  subject do
    described_class.new(
      basket_repository: basket_repository,
      receipt_repository: receipt_repository
    )
  end

  let(:basket_list) { double(:basket_list) }

  let(:basket_repository) { double(:basket_repository) }
  let(:receipt_repository) { double(:receipt_repository) }

  let(:process) { subject.process(basket_list) }

  let(:basket_items_collection) { double(:basket_items_collection) }

  let(:receipt_item_1) do
    Entities::ReceiptItem.new(
      product: 'the-product-1',
      price: '12.00',
      quantity: 2,
      taxes: 0.6
    )
  end

  let(:receipt_item_2) do
    Entities::ReceiptItem.new(
      product: 'the-product-2',
      price: '20.00',
      quantity: 4,
      taxes: 1.0
    )
  end

  let(:receipt_items_collection) do
    Collections::ReceiptItems.new([receipt_item_1, receipt_item_2])
  end

  let(:items) do
    ['2 the-product-1 25.20', '4 the-product-2 84.00']
  end

  let(:total) { 109.2 }
  let(:taxes) { 5.2 }

  describe '#process' do
    before do
      allow(basket_repository).to receive(:fetch_basket_list)
        .with(basket_list)
        .and_return(basket_items_collection)

      allow(receipt_repository).to receive(:create_receipt)
        .with(basket_items_collection)
        .and_return(receipt_items_collection)
    end

    let(:expected_receipt) do
      Receipt.new(items: items, total: total, taxes: taxes)
    end

    it 'brings the items from the basket' do
      expect(basket_repository).to receive(:fetch_basket_list)
        .with(basket_list)

      process
    end

    it 'creates a receipt list collection' do
      expect(receipt_repository).to receive(:create_receipt)
        .with(basket_items_collection)

      process
    end

    it 'generates the receipt' do
      expect(process).to be_equal_to(expected_receipt)
    end
  end
end
