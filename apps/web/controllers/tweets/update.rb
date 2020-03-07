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

                    unless Hash(params).key? :tweet_edited
                        raise ("Tweet not found / doesnt exist")
                    end

                    updated = params[:tweet_edited]
                    updated_tweet = tweet_repo.update(params[:id], username: updated[:username], content: updated[:content])
                    updated_tweet = tweet_repo.find(params[:id])
                end

                
                def call(params)
                    update_tweet
                    redirect_to "/tweets/#{params[:id]}"
                end
            end
        end
    end
end
