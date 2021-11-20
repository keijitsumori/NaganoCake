Rails.application.routes.draw do
  
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords,],controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
    
  
end
