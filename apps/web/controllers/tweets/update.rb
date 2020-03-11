module Web
    module Controllers
        module Tweets
            class Update
                include Web::Action
                
                expose :updated_tweet

                attr_accessor :updated_tweet, :tweet_repo
                def initialize(tweet_repo = TweetRepository.new)
                    @tweet_repo ||= tweet_repo
                end

                def update_tweet 
                    updated = params[:tweet_edited]
                    updated_tweet = tweet_repo.update(params[:id], content: updated[:content])
                    updated_tweet = tweet_repo.find(params[:id])
                rescue
                    halt 500
                end

                
                def call(params)
                    update_tweet
                    redirect_to "/tweets/#{params[:id]}"
                end
            end
        end
    end
end
