module Web
    module Controllers
        module Tweets
            class Api
                include Web::Action
                require 'json'

                expose :tweets

                def call(params)
                    @tweets = TweetRepository.new.all

                    response = []

                    tweets.each do |t|
                        response << t.to_h
                    end

                    self.headers.merge!({'Access-Control-Allow_origin' => '*'})
                    self.body = JSON.generate(response)
                end
            end
        end
    end
end
