module Web
  module Controllers
    module Tweets
      class ShowUserTweets
        include Web::Action

        expose :user, :user_tweets
        def initialize(user_repo: UserRepository.new)
          @user_repo = user_repo
        end

        def call(params)
          @user = @user_repo.find_with_tweets(params[:user_id])
          @user_tweets = @user.fetch(:tweets)
        end
      end
    end
  end
end
