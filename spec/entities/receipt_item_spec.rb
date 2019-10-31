# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Entities::ReceiptItem do
  subject do
    described_class.new(
      price: price,
      product: product,
      quantity: quantity,
      taxes: taxes
    )
  end

  let(:price) { '10.00' }
  let(:product) { 'the-product' }
  let(:quantity) { '1' }
  let(:taxes) { '1.50' }

  it 'has a price' do
    expect(subject.price).to eq(10.00)
  end

  it 'has a product' do
    expect(subject.product).to eq('the-product')
  end

  it 'has a quantity' do
    expect(subject.quantity).to eq(1)
  end

  it 'has taxes' do
    expect(subject.taxes).to eq(1.50)
  end

  describe '#total' do
    let(:quantity) { 3 }

    it 'returns the total for a receipt item' do
      expect(subject.total).to eq(34.5)
    end
  end
end
