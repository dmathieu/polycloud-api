Polycloud::Application.routes.draw do
  root 'welcome#index'

  scope module: 'api' do
    api_version(1) do

      scope module: 'users' do
        resources :users, controller: 'main', only: [:show, :create]
        resources :sessions, only: :create
      end

      scope module: 'snippets' do
        resources :snippets, controller: 'main'
        resources :languages
      end
    end
  end

end
