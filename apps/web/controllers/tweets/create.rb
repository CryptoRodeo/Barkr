module Web
  module Controllers
    module Tweets
      class Create
        include Web::Action
        
        expose :tweet
        
        # DRY validations for the form inputs.
        params do
          required(:tweet).schema do
            required(:username).filled(:str?)
            required(:content).filled(:str?)
          end
        end


        def call(params)
          if params.valid?
            @tweet = TweetRepository.new.create(params[:tweet])

            redirect_to '/tweets'
          else
            self.status = 422 #set to 422, pass control to view.
          end
        end
      end
    end
  end
end
