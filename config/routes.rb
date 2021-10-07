Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resource :genders
    end
  end
  namespace :api do
    namespace :v1 do
      resource :movies
    end
  end
  namespace :api do
    namespace :v1 do
      resource :characters
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
