module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        
        expose :tweets

        def call(params)
          @tweets = TweetRepository.new.all
          puts "#{@tweets.class}"
        end
      end
    end
  end
end
