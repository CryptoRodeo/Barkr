module Web
    module Controllers
        module Tweets
            class Edit
                include Web::Action
                
                attr_accessor :updated_tweet, :tweet_repo
                expose :updated_tweet

                def initialize(tweet_repo: TweetRepository.new)
                    @tweet_repo = tweet_repo
                end

                def call(params)
                    @updated_tweet = tweet_repo.find(params[:id])
                rescue
                    halt 500
                end
            end
        end
    end
end
