module Web
    module Controllers
        module Tweets
            class Update
                include Web::Action
                
                attr_accessor :tweet_repo
                def initialize(tweet_repo: TweetRepository.new)
                    @tweet_repo = tweet_repo
                end

                def call(params)
                    tweet_repo.update(params[:id], content: params[:tweet_edited][:content])
                    puts response
                    redirect_to "/tweets/#{params[:id]}"
                rescue
                    halt 500
                end
            end
        end
    end
end
