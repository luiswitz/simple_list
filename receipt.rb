# frozen_string_literal: true

class Receipt
  def initialize(items:, taxes:, total:)
    @items = items
    @taxes = taxes
    @total = total
  end

  def output_receipt
    output_items
    output_taxes
    output_total
  end

  private

  def output_items
    @items.each do |item|
      puts item
    end
  end

  def output_taxes
    puts "Sales Taxes: #{format('%0.2f', @taxes)}"
  end

  def output_total
    puts "Total: #{format('%0.2f', @total)}"
  end
end
