require 'twilio-ruby'
require 'sinatra'
require_relative 'my_recipes'
require_relative 'items'
require 'byebug'

post '/' do
  byebug
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(
      body: 'Ahoy! Thanks so much for your message.'
      )
  end

  twiml.to_s  
end

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

twillio_num = ENV['TWILIO_NUM']
my_num = ENV['MY_NUM']

# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "Hello from Ruby",
#     to: twillio_num,
#     from: my_num
#     )

