Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', action: :index, controller: :main
  get 'bars/near', action: :near, controller: :bars
end
