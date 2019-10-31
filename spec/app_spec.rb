# frozen_string_literal: true

require 'spec_helper'

RSpec.describe App do
  subject do
    described_class.new(lists: lists)
  end

  let(:lists) { %w[list1 list2 list3] }

  let(:receipt_processor_factory) { double(:receipt_processor_factory) }
  let(:receipt_processor) { double(:receipt_processor) }
  let(:receipt) { double(:receipt) }

  let(:run) { subject.run }

  before do
    allow(ReceiptProcessorServiceFactory).to receive(:new)
      .and_return(receipt_processor_factory)

    allow(receipt_processor_factory).to receive(:build)
      .and_return(receipt_processor)

    lists.each do |list|
      allow(receipt_processor).to receive(:process)
        .with(list)
        .and_return(receipt)
    end

    allow(receipt).to receive(:output_receipt)
  end

  describe '#run' do
    it 'builds a new receipt processor service' do
      expect(ReceiptProcessorServiceFactory).to receive(:new)
      expect(receipt_processor_factory).to receive(:build)

      run
    end

    it 'processes the received lists' do
      run

      lists.each do |list|
        expect(receipt_processor).to have_received(:process).with(list)
      end
    end

    it 'outputs the receipt' do
      expect(receipt).to receive(:output_receipt).exactly(lists.size).times

      run
    end
  end
end
