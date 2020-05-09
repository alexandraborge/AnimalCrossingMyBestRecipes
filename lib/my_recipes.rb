require 'yaml'
require_relative 'items'
require 'byebug'
require_relative 'format_helpers'

class MyRecipes < Items
  include FormattingHelpers

  def self.build
    YAML.load(File.read('lib/my_recipes.yml'))
  end

  def self.all
    build.flat_map { |category, items| items }.uniq
      &.map { |item| Items.find_item(item.downcase) }
  end
end

puts MyRecipes.all