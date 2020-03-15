module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        
        attr_accessor :ip, :tweets
        
        expose :tweets, :user, :ip

        def initialize(user_repo: UserRepository.new, tweets: TweetRepository.new)
          @user_repo = user_repo
          @tweets = tweets.all
        end


        def call(params)
          @ip = request.ip.to_s
          @user_repo.create(ip: @ip) unless ip_stored?(@ip)
          set_session(user)
        end

        params do
          required(:tweet).schema do
            required(:content).filled(:str?)
          end
        end  

        private

        def ip_stored?(ip)
          @user_repo.ip_exists?(ip)
        end

        def user
          @user = @user_repo.find_by_ip(@ip)
        end

        def set_session(user)
          session[:user_id] = user.id
        end
      end
    end
  end
end
