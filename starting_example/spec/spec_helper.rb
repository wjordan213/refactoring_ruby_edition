require 'simplecov'

SimpleCov.start

require './lib/customer.rb'
require './lib/movie.rb'
require './lib/rental.rb'

# %w{ lib/movie lib/rental lib/customer }.each do |file|
#   require File.expand_path file
# end
