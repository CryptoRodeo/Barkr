# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
#

root to: 'home#index'


get '/tweets', to: 'tweets#index'
get '/tweets/new', to: 'tweets#new'
post '/tweets', to: 'tweets#create'
