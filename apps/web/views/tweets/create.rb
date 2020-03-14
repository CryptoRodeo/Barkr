module Web
  module Views
    module Tweets
      class Create
        include Web::View
        #render this template
        template 'tweets/index'
      end
    end
  end
end
