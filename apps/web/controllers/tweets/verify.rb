module Web
    module Controllers
        module Tweets
            class Verify
                include Web::Action

                expose :tweet

                def initialize(tweet_repo: TweetRepository.new)
                  @tweet_repo = tweet_repo
                end

                def call(params)
                  @tweet = @tweet_repo.find(params[:id])
                rescue
                  halt 500, "Invalid ID"
                end
            end
        end
    end
end