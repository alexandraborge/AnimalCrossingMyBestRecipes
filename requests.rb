require 'twilio-ruby'
require 'sinatra'
require_relative 'lib/my_recipes'
require_relative 'lib/items'
require 'byebug'

class Responses

  def initialize(request)
    @request = request
  end

  def build_response
    request = @request.downcase
    item = Items.find_item(request)
    number = request.split.detect  {|x| x[/\d+/]}.to_i || 10
    category = request.split.detect { |x| Items.categories.include?(x) } || ''
    
    case request
    when "top #{number} overall"
      Items.most_expensive_overall(number)
    when "top #{number} #{category}"
      Items.most_expensive_by_category(category, number)
    when "my top #{number} overall"
      MyRecipes.most_expensive_overall(number)
    when "my top #{number} #{category}"
      MyRecipes.most_expensive_by_category(category, number)
    when "#{item["Name"].downcase}"
      Items.find_item_price(item)
    else
      "Don't know that request"
    end
  end
end

post '/' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(
      body: Responses.new(params["Body"]).build_response
      )
  end

  twiml.to_s  
end
