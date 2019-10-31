# frozen_string_literal: true

class ReceiptRepositoryFactory
  def build
    tax_calculator = Services::TaxCalculatorService.new
    Repositories::ReceiptRepository.new(tax_calculator: tax_calculator)
  end
end
