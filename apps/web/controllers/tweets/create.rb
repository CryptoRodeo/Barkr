module Web
  module Controllers
    module Tweets
      class Create
        include Web::Action

        def call(params)
          TweetRepository.new.create(params[:tweet])

          redirect_to '/tweets'
        end
      end
    end
  end
end
