# frozen_string_literal: true

module Services
  class TaxCalculatorService
    DUTY_TAX = 0.05
    BASIC_TAX = 0.1
    ROUND_PRECISION = 0.05

    def calculate(item)
      tax = 0.00

      if item.imported?
        duty_tax = item.price * DUTY_TAX
        duty_tax = round_near(duty_tax, ROUND_PRECISION)

        tax += duty_tax
      end

      if basic_sales_tax_applicable?(item)
        basic_tax = item.price * BASIC_TAX
        basic_tax = round_near(basic_tax, ROUND_PRECISION)

        tax += basic_tax
      end

      tax
    end

    private

    def basic_sales_tax_applicable?(item)
      return true unless item.food? || item.book? || item.medical?

      false
    end

    def round_near(tax, precision)
      (tax / precision).ceil * precision
    end
  end
end
