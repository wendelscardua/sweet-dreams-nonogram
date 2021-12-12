#!/usr/bin/ruby
# frozen_string_literal: true

require 'json'

rows = File.readlines(ARGV[0], chomp: true)

def nonify(rows)
  rows.map do |row|
    row.gsub(/(#+)/) { |block| block.size.to_s }
       .gsub(/\.+/, ' ')
       .strip
       .split(/ /)
  end
end

cols = (0...25).map do |index|
  rows.map { |row| row[index] }.join
end

data = { "ver" => nonify(rows), "hor" => nonify(cols) }
puts JSON.pretty_generate(data)
