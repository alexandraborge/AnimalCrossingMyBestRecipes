require 'twilio-ruby'
require 'sinatra'
require_relative 'my_recipes'
require_relative 'items'

post '/' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(
      body: 'Ahoy! Thanks so much for your message.'
      )
  end

  twiml.to_s  
end

echo "export TWILIO_ACCOUNT_SID='AC26423a3001a3a0721a6bdba54a508f81'" > twilio.env
echo "export TWILIO_AUTH_TOKEN='d16b67d62208431bc0905fbfc605c6fc'" >> twilio.env
source ./twilio.env

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

