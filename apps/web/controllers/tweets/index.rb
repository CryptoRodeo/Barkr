module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        require 'open-uri'
        require 'json'
       
        attr_accessor :ip, :tweets, :user
        expose :tweets, :user, :ip
        
        def initialize(user_repo: UserRepository.new, tweets:  TweetRepository.new.all)
          @user_repo = user_repo
          @tweets = tweets
        end

        def call(params)
          @ip = request.ip.to_s
         @user_repo.create(ip: @ip) unless ip_stored?(@ip)
          set_session(user)
        end

        private

        def ip_stored?(ip)
          @user_repo.ip_exists?(ip)
        end

        def user
          @user  = @user_repo.by_ip(@ip)
        end

        def set_session(user)
          session[:user_id] = user.id
        end
      end
    end
  end
end
