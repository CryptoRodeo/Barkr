module Web
    module Controllers
        module Tweets
            class Read
                include Web::Action

                
                attr_accessor :tweet, :tweet_repo
                expose :tweet
                
                def initialize(tweet_repo = TweetRepository.new)
                    @tweet_repo ||= tweet_repo
                end

                def find_tweet
                    tweet_repo.find(params[:id])
                rescue
                    halt 500, "Invalid ID"
                end

                def call(params)
                    @tweet = find_tweet
                end
            end
        end
    end
end