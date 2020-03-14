module Web
    module Controllers
        module Tweets
            class Delete
                include Web::Action

                attr_accessor :tweet_repo

                def initialize(tweet_repo: TweetRepository.new)
                    @tweet_repo = tweet_repo
                end

                def call(params)
                    tweet_repo.delete(params[:id])
                    redirect_to '/tweets/'
                end
            end
        end
    end
end