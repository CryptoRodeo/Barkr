class Tweet < Hanami::Entity
    def fetch(key)
      Hash(self).fetch(key)
    end
end
