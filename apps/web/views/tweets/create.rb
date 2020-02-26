module Web
  module Views
    module Tweets
      class Create
        include Web::View
        template 'tweets/new'
      end
    end
  end
end
