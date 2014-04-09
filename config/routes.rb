Betterlaughs::Application.routes.draw do

    root 'laughs#index'

    resources :laughs
    match '/laughs/:id/raw', to: 'laughs#raw', via: 'get'
    match '/laughs/:id/increment_views', to: 'laughs#increment_views', via: 'post'
end
