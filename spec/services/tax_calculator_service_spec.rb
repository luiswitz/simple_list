# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Services::TaxCalculatorService do
  let(:calculate) do
    subject.calculate(basket_item)
  end

  describe '#calculate' do
    context 'when no taxes are appliable' do
      let(:basket_item) do
        Entities::BasketItem.new(
          product: 'chocolate',
          price: '47.50',
          quantity: 1
        )
      end

      it 'returns zero' do
        expect(calculate).to eq(0)
      end
    end

    context 'when taxes are appliable' do
      context 'when item is imported' do
        let(:basket_item) do
          Entities::BasketItem.new(
            product: 'imported chocolate',
            price: '10.00',
            quantity: 1
          )
        end

        it 'applies the import duty' do
          expect(calculate).to eq(0.5)
        end
      end

      context 'when item applies for basic sales tax' do
        let(:basket_item) do
          Entities::BasketItem.new(
            product: 'perfume',
            price: '16.1',
            quantity: 1
          )
        end

        it 'applies the basic tax' do
          expect(calculate).to be_within(0.05).of(1.65)
        end
      end

      context 'when product is imported and applies for basic sales tax' do
        let(:basket_item) do
          Entities::BasketItem.new(
            product: 'imported perfume',
            price: '40.00',
            quantity: 1
          )
        end

        it 'applies both taxes' do
          expect(calculate).to eq(6)
        end
      end
    end
  end
end
