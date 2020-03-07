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
                    unless params[:tweet_edited].nil?
                        updated = params[:tweet_edited]
                        @updated_tweet = tweet_repo.update(params[:id], username: updated[:username], content: updated[:content])
                    else
                        @updated_tweet = tweet_repo.find(params[:id])
                    end
                end

                
                def call(params)
                    update_tweet
                    redirect_to "/tweets/#{params[:id]}"
                end
            end
        end
    end
end
