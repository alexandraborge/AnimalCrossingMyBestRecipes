require 'yaml'
require 'singleton'

class MyRecipes
  include Singleton

  def all
    YAML.load(File.read('my_recipes.yml'))
  end
end

puts MyRecipes.instance.all