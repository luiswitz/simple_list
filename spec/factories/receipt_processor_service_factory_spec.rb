# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReceiptProcessorServiceFactory do
  let(:expected_object) do
    Services::ReceiptProcessorService.new(
      basket_repository: basket_repository,
      receipt_repository: receipt_repository
    )
  end

  let(:basket_repository) { BasketRepositoryFactory.new.build }
  let(:receipt_repository) { ReceiptRepositoryFactory.new.build }

  describe '#build' do
    it 'returns the expected object' do
      expect(subject.build).to be_equal_to(expected_object)
    end
  end
end
