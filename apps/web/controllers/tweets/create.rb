module Web
  module Controllers
    module Tweets
      class Create
        include Web::Action
        
        expose :tweet
        
        def initialize(tweet = TweetRepository.new)
          @tweet ||= tweet
        end

        def validate_inputs
          # DRY validations for the form inputs.
          params do
            required(:tweet).schema do
              required(:username).filled(:str?)
              required(:content).filled(:str?)
            end
          end
        end

        def create_tweet
          @tweet.create(params[:tweet])
        end

        def inputs_valid?
          params.valid?
        end

        def call(params)
          validate_inputs
          if inputs_valid?
            create_tweet
            redirect_to '/tweets'
          else
            self.status = 422 #set to 422, pass control to view.
          end
        end
      end
    end
  end
end
