require 'simplecov'

SimpleCov.start

require './lib/customer.rb'
require './lib/movie.rb'
require './lib/rental.rb'
require './lib/regular_price.rb'
require './lib/new_release_price.rb'
require './lib/childrens_price.rb'

# %w{ lib/movie lib/rental lib/customer }.each do |file|
#   require File.expand_path file
# end
