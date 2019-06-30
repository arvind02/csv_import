Rails.application.routes.draw do
  resources :policies
  resources :companies do 
  	collection do 
  		get :show_import
  		post :import_csv
  	end
  end
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'companies#index'
end
