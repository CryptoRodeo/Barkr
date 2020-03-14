module Web
    module Controllers
        module Tweets
            class Api
                include Web::Action
                require 'json'
                
                attr_accessor :tweets, :api

                def initialize(tweets: TweetRepository.new.all)
                    @tweets = tweets
                end

                def api
                    @api = JSON.generate(@response)
                end

                def call(params)
                    @response = @tweets.map(&format) 
                    self.headers.merge!({'Access-Control-Allow_origin' => '*'})
                    self.body = api
                end
            end
        end
    end
end
