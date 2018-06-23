Rails.application.routes.draw do
  
  root 'events#index'
  
  resources :charges
  resources :events

  get "events/subscribe/:id", to: "events#subscribe"
  get "events/closingevent/:id", to: "events#closingevent"
  post "events/pay/:id", to: "events#pay", as: "pay"
  get "events/after_subscribeandpay/:id", to: "events#after_subscribeandpay"
  get "events/after_pay/:id", to: "events#after_pay", as: 'after_pay'

  get "events/ele/:ele_id/:id", to: "events#addeletoinvitation"
  get "events/pro/:pro_id/:id", to: "events#addprotoinvitation"
  
  devise_for :pros, :controllers => { registrations: 'registrations_pro' }
  devise_for :eles, :controllers => { registrations: 'registrations_ele' }

  get "eles/index", to: "eles#index", as: "eles"
  get "eles/show/:id", to: "eles#show", as: "ele"
  get "pros/index", to: "pros#index", as: "pros"
  get "pros/show/:id", to: "pros#show", as: "pro"

end
