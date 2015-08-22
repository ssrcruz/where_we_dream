Rails.application.routes.draw do

  get 'pages/home'

  get 'pages/schools'

  root 'pages#home'
  get 'schools' => 'pages#schools'
  match 'schools', :via => :search, :to => 'admin/schools#search'

  namespace :admin do
    resources :schools
  end

end
