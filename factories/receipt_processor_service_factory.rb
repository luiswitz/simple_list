# frozen_string_literal: true

class ReceiptProcessorServiceFactory
  def build
    basket_repository = BasketRepositoryFactory.new.build
    receipt_repository = ReceiptRepositoryFactory.new.build

    Services::ReceiptProcessorService.new(
      basket_repository: basket_repository,
      receipt_repository: receipt_repository
    )
  end
end
