# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Receipt do
  subject do
    described_class.new(items: items, taxes: taxes, total: total)
  end

  let(:items) { ['1 item-1 10.00'] }
  let(:taxes) { 1.4 }
  let(:total) { 23.3 }

  let(:output_receipt) { subject.output_receipt }

  describe '#output_receipt' do
    before do
      receipt_output = StringIO.new
      $stdout = receipt_output
    end

    it 'outputs items' do
      output_receipt
      expect($stdout.string).to include('1 item-1 10.00')
    end

    it 'outputs taxes' do
      output_receipt
      expect($stdout.string).to include('Sales Taxes: 1.40')
    end

    it 'outputs total' do
      output_receipt
      expect($stdout.string).to include('Total: 23.30')
    end
  end
end
