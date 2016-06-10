Rails.application.routes.draw do
  


  root 'klasses#index'
  
  resources :students do
      member do
          # return progress of a student
          get 'progress', to: 'student_lesson_trackers#show', :defaults => { :format => 'json' }
          
          # save progress of a student
          post 'progress', to: 'student_lesson_trackers#create',  :defaults => { :format => 'json' }
      end
  end
  resources :klasses, :only => [:index, :show]
end
