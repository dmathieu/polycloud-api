Polycloud::Application.routes.draw do
  root 'welcome#index'

  scope module: 'api' do
    api_version(1) do

      post '/login' => 'users/sessions#create'
      scope module: 'users' do
        resources :users, controller: 'main', only: :show
      end

      scope module: 'snippets' do
        resources :snippets, controller: 'main'
      end
    end
  end

end
