module Web
    module Controllers
        module Tweets
            class Api
                include Web::Action
                require 'json'
                
                attr_accessor :tweets, :api

                def initialize(tweets = TweetRepository.new.all)
                    @tweets ||= tweets
                    @response = convert_tweets :to_h
                end

                def api
                    @api = JSON.generate(@response)
                end

                def convert_tweets(format)
                    @tweets.map(&format) if Array(@tweets).respond_to?(format)
                end

                def call(params)
                    self.headers.merge!({'Access-Control-Allow_origin' => '*'})
                    self.body = api
                end
            end
        end
    end
end
