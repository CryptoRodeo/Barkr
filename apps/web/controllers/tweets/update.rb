module Web
    module Controllers
        module Tweets
            class Update
                include Web::Action
                
                expose :updated_tweet
                
                def call(params)
                    tweet_repo = TweetRepository.new
                    unless params[:editable_tweet].nil?
                        updated = params[:editable_tweet]
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
