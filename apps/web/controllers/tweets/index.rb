module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        require 'open-uri'
        require 'json'

        attr_accessor :ip
        expose :tweets

        def call(params)
          @tweets = TweetRepository.new.all
          
          location = URI.open('https://ipapi.co/json/').read
         @ip = Hash(JSON.parse(location, :symbolize_names => true))
          
         puts "IP ADDRESS: #{self.ip[:ip]}"
          puts "From Hanami: #{request.ip}" # performance degragating, not recommended.
          puts "From Rack: #{params.env["REMOTE_ADDR"]}"
        
        end
      end
    end
  end
end
