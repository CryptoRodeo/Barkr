module Web
    module Controllers
        module Tweets
            class Edit
                include Web::Action
                
                attr_accessor :tweet_edited, :tweet_repo
                expose :tweet_edited

                def initialize(tweet_repo = TweetRepository.new)
                    @tweet_repo ||= tweet_repo
                end


                def call(params)
                    @tweet_edited = tweet_repo.find(params[:id])
                end
            end
        end
    end
end
