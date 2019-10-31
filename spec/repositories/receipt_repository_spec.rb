# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Repositories::ReceiptRepository do
  subject do
    described_class.new(tax_calculator: tax_calculator)
  end

  let(:tax_calculator) { double(:tax_calculator) }
  let(:create_receipt) { subject.create_receipt(items) }

  let(:basket_item_1) { Entities::BasketItem.new(product: 'item-1', price: 10.0, quantity: 2) }
  let(:basket_item_2) { Entities::BasketItem.new(product: 'item-2', price: 20.0, quantity: 4) }

  let(:receipt_item_1) do
    Entities::ReceiptItem.new(product: 'item-1', price: 10.0, quantity: 2, taxes: 10.5)
  end

  let(:receipt_item_2) do
    Entities::ReceiptItem.new(product: 'item-2', price: 20.0, quantity: 4, taxes: 22.00)
  end

  let(:items) do
    Collections::BasketItems.new([basket_item_1, basket_item_2])
  end

  describe '#create_receipt' do
    before do
      allow(tax_calculator).to receive(:calculate)
        .with(basket_item_1)
        .and_return(10.5)

      allow(tax_calculator).to receive(:calculate)
        .with(basket_item_2)
        .and_return(22.00)
    end

    let(:expected_collection) do
      Collections::ReceiptItems.new([receipt_item_1, receipt_item_2])
    end

    it 'delegates de tax calculus to the tax calculator' do
      expect(tax_calculator).to receive(:calculate).with(basket_item_1)
      expect(tax_calculator).to receive(:calculate).with(basket_item_2)

      create_receipt
    end

    it 'returns a collection of receipt items' do
      expect(create_receipt).to be_equal_to(expected_collection)
    end
  end
end
