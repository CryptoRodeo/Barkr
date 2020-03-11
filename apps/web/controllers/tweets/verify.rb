module Web
    module Controllers
        module Tweets
            class Verify
                include Web::Action

                expose :tweet

                def call(params)
                    tweet_repo = TweetRepository.new
                   @tweet = tweet_repo.find(params[:id])
                rescue
                        halt 500, "Invalid ID"
                end
            end
        end
    end
end