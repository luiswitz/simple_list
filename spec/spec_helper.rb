# frozen_string_literal: true

RSpec.configure do |config|
  config.before { allow($stdout).to receive(:puts) }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def fixture_path
  File.expand_path('fixtures', __dir__)
end

require 'object_comparator/rspec'

require_relative '../storage/basket_storage'
