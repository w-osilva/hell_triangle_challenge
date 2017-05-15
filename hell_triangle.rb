# encoding: utf-8
require_relative 'boot'

triangle ||= [[6],[3,5],[9,7,1],[4,6,8,4]]

hell_triangle = Triangle.new(triangle)
hell_triangle.process

puts "#{hell_triangle.max_values.join(' + ')} = #{hell_triangle.total}"