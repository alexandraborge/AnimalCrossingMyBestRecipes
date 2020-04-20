require 'csv'

class Items

  def self.all
    items = {}
  
    Dir.each_child('items') do |path|
      item = new(path) 
      items.merge!(item.create_item)
    end
  
    items
  end

  def initialize(path)
    @category = path.gsub('.csv', '')
    @path = "items/#{path}"
  end
  
  def create_item
    item = {}
    item[@category] = []

    CSV.foreach(@path, headers: true) do |row|
      item[@category].push(row.to_h)
    end

    item
  end
end

puts Items.all['fish']
