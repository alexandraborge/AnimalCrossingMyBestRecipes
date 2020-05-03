require 'csv'
require_relative 'format_helpers'

class Items
  include FormattingHelpers

  def self.build
    files = Dir.children('items')
    items_hash = {}
    
    files.each do |path|
      items = new(path) 
      items_hash.merge!(items.create_items)
    end
  
    items_hash
  end

  def self.all
    build.flat_map { |category, items| items }.uniq { |item| item['Name'] } 
  end

  def self.most_expensive_overall(number_of_records = 10)
    FormattingHelpers.formatted_results(sorted_items(all, number_of_records))
  end

  def self.most_expensive_by_category(category, number_of_records = 10)
    FormattingHelpers.formatted_results(sorted_items(build[category], number_of_records))
  end

  def self.sorted_items(items, number_of_records)
    items.sort_by { |item| item['Price'] }.reverse[0..(number_of_records - 1)]
  end


  def initialize(path)
    @category = path.gsub('.csv', '')
    @path = "items/#{path}"
  end
  
  def create_items
    items = {}
    items[@category] = []

    CSV.foreach(@path, headers: true) do |item|
      item = item.to_h
      item['Price'] = formatted_price(item)
      items[@category].push(item)
    end

    items
  end
end

puts Items.most_expensive_overall(300)