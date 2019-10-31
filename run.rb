#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'setup'

basket_lists = [
  'basket_lists/list_1.txt',
  'basket_lists/list_2.txt',
  'basket_lists/list_3.txt'
]

app = App.new(lists: basket_lists)
app.run
