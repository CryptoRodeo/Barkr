module Web
    module Controllers
        module Tweets
            class Edit
                include Web::Action
                
                expose :editable_tweet

                def call(params)
                    tweet_repo = TweetRepository.new
                    @editable_tweet = tweet_repo.find(params[:id])
                end
            end
        end
    end
end
