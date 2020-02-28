# Configure your routes here
#
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
#

root to: 'tweets#index'
#resources: helper function to create REST style routes.
#resources :tweets, only: [:index, :new, :create]

get '/tweets', to: 'tweets#index'
#get '/tweets/new', to: 'tweets#new'
post '/tweets', to: 'tweets#create'
