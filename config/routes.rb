Rails.application.routes.draw do

  get '/cluster/:cid/health_data', to: 'cluster#health_data'

end
