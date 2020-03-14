module Web
  module Controllers
    module Tweets
      class Create
        include Web::Action
       
        expose :tweets, :created_by, :tweet
        
        def initialize(tweets: TweetRepository.new)
          @tweets = tweets
        end

         params do
            required(:tweet).schema do
              required(:content).filled(:str?)
            end
          end

        def call(params)
          @tweets.create(created_by: session[:user_id],content: params[:tweet][:content]) unless params.valid?
          redirect_to '/tweets?invalid_inputs'
          rescue 
           halt 422 
        end
      end
    end
  end
end
