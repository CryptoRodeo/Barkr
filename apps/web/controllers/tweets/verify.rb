module Web
    module Controllers
        module Tweets
            class Verify
                include Web::Action

                expose :tweet

                def call(params)
                    tweet_repo = TweetRepository.new
                    unless params[:id].nil?
                        @tweet = tweet_repo.find(params[:id])
                    end
                end
            end
        end
    end
end