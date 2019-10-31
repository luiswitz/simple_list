# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BasketRepositoryFactory do
  let(:expected_object) do
    Repositories::BasketRepository.new(storage: storage)
  end

  let(:storage) { Storage::BasketStorage.new }

  describe '#build' do
    it 'returns the expected object' do
      expect(subject.build).to be_equal_to(expected_object)
    end
  end
end
