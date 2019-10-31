# frozen_string_literal: true

class App
  def initialize(lists:)
    @lists = lists
  end

  def run
    @lists.each do |list|
      puts '-' * 50
      receipt = receipt_processor.process(list)
      receipt.output_receipt
    end
  end

  private

  def receipt_processor
    ReceiptProcessorServiceFactory.new.build
  end
end
