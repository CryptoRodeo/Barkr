class UserRepository < Hanami::Repository
    def ip_exists?(ip)
        users.where(ip: ip).exist?
    end 
end
