Rails.application.routes.draw do
  
  root 'students#index'
  
  resources :lessons
  resources :students do
      member do
          get 'progress'    # return progress of a student
          post 'progress'   # save progress of a student
      end
  end

end
