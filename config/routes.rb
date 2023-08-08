Rails.application.routes.draw do
  # http_verb '/path', to: 'controller#action', as: :prefix
  # CRUD: READ all, CREATE one, READ one, UPDATE one, DESTROY one
  # READ all
  get '/index', to: 'tasks#index', as: :tasks
  # CREATE 1)create a page for the form (GET user input) 2) send the info(POST)
  get '/new', to: 'tasks#new', as: :new_task
  post '/index', to: 'tasks#create'

  # READ
  get '/tasks/:id', to: 'tasks#show', as: :task

  # UPDATE
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'tasks/:id', to: 'tasks#update'

  # DESTROY
  delete '/tasks/:id', to: 'tasks#destroy'
end
