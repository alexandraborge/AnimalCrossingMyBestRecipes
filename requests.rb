require 'twilio-ruby'
require 'sinatra'

post '/' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: 'Ahoy! Thanks so much for your message.')
  end

  twiml.to_s  
end

# account_sid = 'AC26423a3001a3a0721a6bdba54a508f81'
# auth_token = 'd16b67d62208431bc0905fbfc605c6fc'
# twillio_num = "+17086345307"
# my_num = "+16319057546"

# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "Hello from Ruby",
#     to: twillio_num,
#     from: my_num
#     )

