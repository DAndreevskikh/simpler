Simpler.application.routes do
  get '/status', 'tests#custom_status'
  get '/tests/:id', 'tests#show'
  get '/tests', 'tests#index'
  post '/tests', 'tests#create'
end
