Rails.application.routes.draw do
  get 'items/index'
  root to: "furima#index"
end
