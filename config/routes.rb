Hotel_Advisor::Application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :users
  resources :hotels do
    collection do
      get 'best'
    end
  end
  resources :comments
  root :to => 'hotels#best'
end
