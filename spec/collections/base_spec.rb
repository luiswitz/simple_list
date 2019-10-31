# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Collections::Base do
  let(:collection_class) do
    Class.new do
      include Collections::Base
    end
  end

  let(:items) { [{ name: 'item' }, { name: 'item2' }] }
  subject { collection_class.new(items) }

  it 'can be instantiated' do
    collection_class.new
  end

  specify '#each' do
    result = subject.each { |i| i[:name] = "each_#{i[:name]}" }
    expect(result.first[:name]).to eq('each_item')
  end

  specify '#map' do
    mapped = subject.map { |i| "mapped_#{i[:name]}" }
    expect(mapped).to eq(%w[mapped_item mapped_item2])
  end
end
