require "twilio-ruby"

module Twilioauth
  
  class Connection
    
    attr_accessor :client, :account
    
    def initialize(account_sid, auth_token)
      @client = Twilio::REST::Client.new account_sid, auth_token
      @account = @client.account
    end
    
    def sms(message, to, from = default_number)
      @client.account.sms.messages.create(
        :from => from,
        :to => to,
        :body => message
      )
    end
    
    def default_number
      #retrieve the default number
      @default_number ||= @account.incoming_phone_numbers.list.first.phone_number
    end
  end
  
  def self.auth(number, options = {})
    connection = Twilioauth::Connection.new(options[:account_sid], options[:auth_token])
    newpin = SecureRandom.hex(3)
    connection.sms(newpin, number)
    return newpin
  end
  
end