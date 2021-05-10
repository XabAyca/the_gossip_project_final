Rails.application.routes.draw do

  get '/team',    to: 'statics#team'
  get '/contact', to: 'statics#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
