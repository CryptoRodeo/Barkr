module Web
    module Controllers
        module Tweets
            class Update
                include Web::Action
                
                expose :updated_tweet
                
                def call(params)
                    tweet_repo = TweetRepository.new
                    unless params[:tweet_edited].nil?
                        updated = params[:tweet_edited]
                        @updated_tweet = tweet_repo.update(params[:id], username: updated[:username], content: updated[:content])
                    else
                        @updated_tweet = tweet_repo.find(params[:id])
                    end
                    redirect_to "/tweets/#{params[:id]}"
                end
            end
        end
    end
end
