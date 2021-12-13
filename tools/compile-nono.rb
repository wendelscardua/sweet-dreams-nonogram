#!/usr/bin/ruby
# frozen_string_literal: true

input = ARGV.shift
asm_output = input.gsub(/json$/, 's')
h_output = input.gsub(/json$/, 'h')

require 'json'
data = JSON.parse(File.read(input))

File.open(asm_output, 'wb') do |asm|
  asm.puts <<~"ASM"
    .include "../src/charmap.inc"
    .segment "RODATA"
    .export _rows, _cols, _right_grid
  ASM

  data['ver'].each.with_index do |row, index|
    asm.puts %Q{row_#{index}: .byte "#{'%-10s' % row.join}"}
  end

  data['hor'].each.with_index do |col, index|
    asm.puts %Q{col_#{index}: .byte "#{'%-10s' % col.join}"}
  end

  asm.puts '_rows:'
  (0...25).each do |i|
    asm.puts ".word row_#{i}"
  end
  asm.puts '_cols:'
  (0...25).each do |i|
    asm.puts ".word col_#{i}"
  end
  asm.puts '_right_grid:'
  asm.puts '.include "qr.inc"'
end

File.open(h_output, 'wb') do |h|
  h.puts <<~"H"
  extern const char * rows[25];
  extern const char * cols[25];
  extern const char right_grid[25][25];
  H
end
