
module FormattingHelpers
  def self.formatted_results(items)
    results = ''
    items.each_with_index do |item, index|
      index += 1
      price = item['Price'].to_s.split('').length > 3 ? item['Price'].to_s.split('').insert(-4, ',').join : item['Price']
      results += "\n#{index}: #{item['Name']} | #{price} bells\n\t #{item['Required Materials']&.gsub(',', "\n\t")}\n----------------------------\n"
    end
    results
  end

  def formatted_price(item)
    item['Price']&.gsub(/[^\d]/, '').to_i
  end
end