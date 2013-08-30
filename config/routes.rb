CapybaraApp::Application.routes.draw do
  root to: 'welcome#index'
  get '/quiz', to: 'welcome#quiz'
end
