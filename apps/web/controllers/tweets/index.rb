module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        require 'open-uri'
        require 'json'
       
        attr_accessor :user, :tweets
        expose :tweets
        
        def initialize(tweets = TweetRepository.new.all)
          @user = {}
          @tweets ||= tweets
        end

        def call(params)
          @user[:ip_address] = params.env["REMOTE_ADDR"]
        end
      end
    end
  end
end
