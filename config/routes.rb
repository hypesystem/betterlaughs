Betterlaughs::Application.routes.draw do

    root 'laughs#index'

    resources :laughs
    match '/laughs/:id/raw', to: 'laughs#raw', via: 'get'
end
