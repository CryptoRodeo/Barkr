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

                def UUID(version)
                    uuid = {
                        :v4 => /^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i
                    }
                    uuid[version.downcase.to_sym]
                end
               
                #checks to see if the id retrieved is valid UUID V4
                def id_valid?
                    params[:id].match?(UUID("v4"))
                end

                def find_tweet
                    unless id_valid?
                        raise ArgumentError, "ID is not valid"
                    end
                    @tweet = tweet_repo.find(params[:id])
                end

                def call(params)
                    @tweet = find_tweet
                end
            end
        end
    end
end