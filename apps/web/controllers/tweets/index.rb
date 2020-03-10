module Web
  module Controllers
    module Tweets
      class Index
        include Web::Action
        require 'open-uri'
        require 'json'
       
        attr_accessor :ip, :tweets
        expose :tweets
        
        def initialize(tweets = TweetRepository.new.all)
          @user_repo = UserRepository.new
          @tweets ||= tweets
        end

        def ip_exists?
          @user_repo.ip_exists?(@ip)
        end

        def call(params)
          @ip = params.env.fetch("REMOTE_ADDR")
          @user_repo.create(ip: @ip) unless ip_exists?
        end
      end
    end
  end
end
