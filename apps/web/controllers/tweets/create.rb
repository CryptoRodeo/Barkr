module Web
  module Controllers
    module Tweets
      class Create
        include Web::Action
       
        expose :tweet, :created_by
        
        def initialize(tweet = TweetRepository.new)
          @tweet = tweet
        end

        def call(params)
          validate_inputs
          if inputs_valid?
            @created_by = session[:user_id]
            create_tweet
            redirect_to '/tweets'
          end
          rescue
          self.status = 422 #set to 422, pass control to view.
        end

        def validate_inputs
          # DRY validations for the form inputs.
          params do
            required(:tweet).schema do
              required(:content).filled(:str?)
            end
          end
        end

        def create_tweet
          @tweet.create(created_by: @created_by,content: params[:tweet][:content])
        end

        def inputs_valid?
          params.valid?
        end
      end
    end
  end
end
