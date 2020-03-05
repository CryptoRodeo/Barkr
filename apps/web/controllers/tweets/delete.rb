module Web
    module Controllers
        module Tweets
            class Delete
                include Web::Action

                def call(params)
                    tweet_repo = TweetRepository.new
                    tweet_repo.delete(params[:id])
                    redirect_to '/tweets/'
                end
            end
        end
    end
end