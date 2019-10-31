# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReceiptRepositoryFactory do
  let(:expected_object) do
    Repositories::ReceiptRepository.new(tax_calculator: tax_calculator)
  end

  let(:tax_calculator) { Services::TaxCalculatorService.new }

  describe '#build' do
    it 'returns the expected object' do
      expect(subject.build).to be_equal_to(expected_object)
    end
  end
end
