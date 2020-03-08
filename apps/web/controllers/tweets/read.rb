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

                def id_valid?
                    begin
                        tweet_repo.find(params[:id])
                    rescue 
                        halt 500, "Invalid ID"
                    end
                end

                def call(params)
                    @tweet = tweet_repo.find(params[:id]) if id_valid?
                end
            end
        end
    end
end