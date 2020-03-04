# Configure your routes here
#
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
#

root to: 'tweets#index'

get '/tweets', to: 'tweets#index'
get '/tweets/:id', to: 'tweets#read'
get '/tweets/:id/edit', to: 'tweets#edit'

post '/tweets', to: 'tweets#create'
patch '/tweets/:id', to: 'tweets#update'

get '/tweets/api', to: 'tweets#api'