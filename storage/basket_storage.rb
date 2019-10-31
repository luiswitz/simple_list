# frozen_string_literal: true

module Storage
  class BasketStorage
    def fetch_basket_list(file)
      content = File.read(file)
      content.split("\n")
    end

    private

    attr_reader :file
  end
end
