CapybaraApp::Application.routes.draw do
  root to: 'welcome#index'
  get '/quiz' => 'quiz#index'
end
