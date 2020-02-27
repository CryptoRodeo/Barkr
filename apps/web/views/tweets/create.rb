module Web
  module Views
    module Tweets
      class Create
        include Web::View
        #render this template
        template 'tweets/new'
      end
    end
  end
end
