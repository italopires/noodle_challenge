Rails.application.routes.draw do
  resources :instant_noodle_times, only: [] do
    resources :hourglass1, only: [] do
      resources :hourglass2, only: [:show], controller: 'instant_noodle_times'
    end
  end
end
