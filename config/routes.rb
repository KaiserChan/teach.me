Rails.application.routes.draw do

  get 'aboutus' => 'aboutus#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/callback' => 'sessions#callback'
  get '/oauth' => 'sessions#oauth'
  post '/user/:id/step/:step_id/submitcode' => 'users#submitcode', as: 'submitcode'
  # get '/languages/ruby' => 'languages#ruby'

resource :user
resources :welcome, only: [:index]
resources :menu, only: [:index, :show]
resources :sessions, only: [:new, :create, :destroy]
namespace :instructors do
  resources :languages, only: [:index,:show, :edit, :update] do
    resources :chapters, only: [:edit, :update] do
      resources :steps, only: [:edit, :update] do
        resources :code_test, only: [:edit, :update]
      end
    end

  end
end


  resources :languages, only: [:index, :show, :update], param: :language_id do
    resources :chapters, only: [:index, :show]  do
      resources :steps, only: [:index, :show]
    end
  end

end
