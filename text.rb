twilio_sid = "AC28922e0822d827ee29834fe1dc6f681e"
twilio_token = "dd701bbc7d0ff144d2cb6fb8c4d476b9" #cost money and cannot share to gitpot 
twilio_sending_number = "+13126636198"

require "twilio-ruby"

# Create an instance of the Twilio Client and authenticate with your API key
twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

# Craft your SMS as a Hash literal with three keys
sms_info = {
  :from => twilio_sending_number,
  :to => "+13154053474", # Put your own phone number here if you want to see it in action
  :body => "It's going to rain today — take an umbrella!"
}

# Send your SMS!
twilio_client.api.account.messages.create(sms_info)
