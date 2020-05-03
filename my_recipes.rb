require 'yaml'
require 'singleton'
require_relative 'items'

class MyRecipes < Items
  include Singleton

  def all
    YAML.load(File.read('my_recipes.yml'))
  end
end

puts Items.all