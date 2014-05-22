Betterlaughs::Application.routes.draw do

    root 'laughs#index'

    match '/upload', to: 'laughs#new', via: 'get'
    resources :laughs
    match '/raw/:id', to: 'laughs#raw', via: 'get'
    match '/laughs/:id/increment_views', to: 'laughs#increment_views', via: 'post'

    match '/signup', to: 'beta_signups#new', via: 'get'
    match '/signup/create', to: 'beta_signups#create', via: 'post'
end
