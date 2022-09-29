Rails.application.routes.draw do
  resources :task_managers
  root "task_managers#index"
end
