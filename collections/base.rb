# frozen_string_literal: true

module Collections
  module Base
    def initialize(items = [])
      @items = items
    end

    def each(&block)
      @items.each(&block)
    end

    def map(&block)
      @items.map(&block)
    end
  end
end
