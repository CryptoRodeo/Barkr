module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        require 'json'        
        expose :tweets

        def call(params)
          @tweets = TweetRepository.new.all
          
          response = []
          
          tweets.each do |tweet|
            response << tweet.to_h
          end

          puts response

          self.body = JSON.generate(response)

        end
      end
    end
  end
end
