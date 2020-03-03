module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        require 'json'        
        expose :tweets

        def call(params)
          @tweets = TweetRepository.new.all
        end
      end
    end
  end
end
