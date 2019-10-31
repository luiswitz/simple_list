# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Storage::BasketStorage do
  let(:file) { "#{fixture_path}/basket_list.txt" }

  let(:fetch_basket_list) { subject.fetch_basket_list(file) }

  describe '#fetch_basket_list' do
    let(:expected_response) do
      [
        '2 super useful item at 12.00',
        '1 item that I really need at 1.00',
        '3 items for home at 40.00'
      ]
    end

    it 'returns an array representing the items list' do
      expect(fetch_basket_list).to eq(expected_response)
    end
  end
end
