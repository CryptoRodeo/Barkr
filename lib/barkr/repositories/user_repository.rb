class UserRepository < Hanami::Repository
    def ip_exists?(ip)
        users.where(ip: ip).exist?
    end 

    def by_ip(ip)
        users.where(ip: ip).one
    end
end
