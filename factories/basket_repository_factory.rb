# frozen_string_literal: true

class BasketRepositoryFactory
  def build
    storage = Storage::BasketStorage.new
    Repositories::BasketRepository.new(storage: storage)
  end
end
