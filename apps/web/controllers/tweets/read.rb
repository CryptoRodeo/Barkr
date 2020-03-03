module Web
    module Controllers
        module Tweets
            class Read
                include Web::Action
                require 'json'

                expose :tweet

                def call(params)
                    tweet_repo = TweetRepository.new
                    @tweet = tweet_repo.find(params[:id])
                end
            end
        end
    end
end