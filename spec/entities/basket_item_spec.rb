# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Entities::BasketItem do
  subject do
    described_class.new(product: product, price: price, quantity: quantity)
  end

  let(:product) { 'the-product' }
  let(:price) { '12.00' }
  let(:quantity) { '1' }

  it 'has a product' do
    expect(subject.product).to eq('the-product')
  end

  it 'has a price' do
    expect(subject.price).to eq(12.00)
  end

  it 'has a quantity' do
    expect(subject.quantity).to eq(1)
  end

  describe '#total' do
    let(:quantity) { 3 }

    it 'returns the item total' do
      expect(subject.total).to eq(36.00)
    end
  end

  describe '#food?' do
    context 'when product is a food' do
      let(:product) { 'chocolate bar' }

      it 'returns true' do
        expect(subject.food?).to eq(true)
      end
    end

    context 'when product is not a food' do
      it 'returns false' do
        expect(subject.food?).to eq(false)
      end
    end
  end

  describe '#book?' do
    context 'when product is a book' do
      let(:product) { 'box of books' }

      it 'returns true' do
        expect(subject.book?).to eq(true)
      end
    end

    context 'when product is not a book' do
      it 'returns false' do
        expect(subject.book?).to eq(false)
      end
    end
  end

  describe '#medical?' do
    context 'when product is a medical product' do
      let(:product) { 'packet of pills' }

      it 'returns true' do
        expect(subject.medical?).to eq(true)
      end
    end

    context 'when product is not a medical product' do
      it 'returns false' do
        expect(subject.medical?).to eq(false)
      end
    end
  end

  describe '#imported?' do
    context 'when the product is imported' do
      let(:product) { 'imported chocolate box' }

      it 'returns true' do
        expect(subject.imported?).to eq(true)
      end
    end

    context 'when the product is not imported' do
      it 'returns false' do
        expect(subject.imported?).to eq(false)
      end
    end
  end
end
