# Configure your routes here
#
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
#

root to: 'tweets#index'

get '/tweets', to: 'tweets#index'
get '/tweets?*', to: 'tweets#index'
get '/tweets/:id', to: 'tweets#read'
get '/tweets/:id/edit', to: 'tweets#edit'
get '/tweets/:id/delete/verify', to: 'tweets#verify'

post '/tweets', to: 'tweets#create'
patch '/tweets/:id', to: 'tweets#update'
delete '/tweets/:id', to: 'tweets#delete'

get 'barkr/tweets/api', to: 'tweets#api'
get '/tweets/user/:user_id/tweets', to: 'tweets#show_user_tweets'
