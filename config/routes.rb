Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  post 'create_event_a', to: 'events#create_event_a'
  post 'create_event_b', to: 'events#create_event_b'
  post 'send_email_for_b', to: 'events#send_email_for_b'
end