class UserRepository < Hanami::Repository

     associations do
         has_many :tweets
     end

     def find_with_tweets(id)
        aggregate(:tweets).where(id: id).as(User).one
     end

    def ip_exists?(ip)
        users.where(ip: ip).exist?
    end 

    def find_by_ip(ip)
        users.where(ip: ip).one
    end
end
