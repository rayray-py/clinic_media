Rails.application.routes.draw do
  root "home#index"

  devise_for :users, skip: [:sessions, :passwords, :registrations], controllers: {
     registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  namespace :clinics do
    resources :prefectures, path: 'area', param: :kana, only: :show do
      resources :cities, only: :show
    end
  end

  namespace :admin do
    resources :articles, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :clinics, only: [:index, :edit, :update, :destroy, :new, :create] do
      get 'search', on: :collection
    end
    resources :users, except: :show
    resources :categories
  end

  namespace :api do
    resources :article_images, only: [:index, :create, :destroy]
    resources :helpful, only: :create
    resources :clinics do
      collection do
        get 'search'
        get 'insert'
      end
    end
  end

  resources :categories, only: [:index, :show]
  resources :clinics, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :contacts, only: [:create]
  resources :search, only: :index
  resources :tags, param: :name, only: :show

  get 'privacy' => 'information#privacy'
  get 'sitemap' => 'information#sitemap'
  get 'contact' => 'contacts#new'
end

# == Route Map
#
#                  Prefix Verb   URI Pattern                                         Controller#Action
#                    root GET    /                                                   home#index
#        new_user_session GET    /login(.:format)                                    devise/sessions#new
#            user_session POST   /login(.:format)                                    devise/sessions#create
#    destroy_user_session DELETE /logout(.:format)                                   devise/sessions#destroy
# clinics_prefecture_city GET    /clinics/area/:prefecture_kana/cities/:id(.:format) clinics/cities#show
#      clinics_prefecture GET    /clinics/area/:kana(.:format)                       clinics/prefectures#show
#          admin_articles GET    /admin/articles(.:format)                           admin/articles#index
#                         POST   /admin/articles(.:format)                           admin/articles#create
#       new_admin_article GET    /admin/articles/new(.:format)                       admin/articles#new
#      edit_admin_article GET    /admin/articles/:id/edit(.:format)                  admin/articles#edit
#           admin_article PATCH  /admin/articles/:id(.:format)                       admin/articles#update
#                         PUT    /admin/articles/:id(.:format)                       admin/articles#update
#                         DELETE /admin/articles/:id(.:format)                       admin/articles#destroy
#    search_admin_clinics GET    /admin/clinics/search(.:format)                     admin/clinics#search
#           admin_clinics GET    /admin/clinics(.:format)                            admin/clinics#index
#       edit_admin_clinic GET    /admin/clinics/:id/edit(.:format)                   admin/clinics#edit
#            admin_clinic PATCH  /admin/clinics/:id(.:format)                        admin/clinics#update
#                         PUT    /admin/clinics/:id(.:format)                        admin/clinics#update
#                         DELETE /admin/clinics/:id(.:format)                        admin/clinics#destroy
#             admin_users GET    /admin/users(.:format)                              admin/users#index
#                         POST   /admin/users(.:format)                              admin/users#create
#          new_admin_user GET    /admin/users/new(.:format)                          admin/users#new
#         edit_admin_user GET    /admin/users/:id/edit(.:format)                     admin/users#edit
#              admin_user PATCH  /admin/users/:id(.:format)                          admin/users#update
#                         PUT    /admin/users/:id(.:format)                          admin/users#update
#                         DELETE /admin/users/:id(.:format)                          admin/users#destroy
#        admin_categories GET    /admin/categories(.:format)                         admin/categories#index
#                         POST   /admin/categories(.:format)                         admin/categories#create
#      new_admin_category GET    /admin/categories/new(.:format)                     admin/categories#new
#     edit_admin_category GET    /admin/categories/:id/edit(.:format)                admin/categories#edit
#          admin_category GET    /admin/categories/:id(.:format)                     admin/categories#show
#                         PATCH  /admin/categories/:id(.:format)                     admin/categories#update
#                         PUT    /admin/categories/:id(.:format)                     admin/categories#update
#                         DELETE /admin/categories/:id(.:format)                     admin/categories#destroy
#      api_article_images GET    /api/article_images(.:format)                       api/article_images#index
#                         POST   /api/article_images(.:format)                       api/article_images#create
#       api_article_image DELETE /api/article_images/:id(.:format)                   api/article_images#destroy
#       api_helpful_index POST   /api/helpful(.:format)                              api/helpful#create
#      search_api_clinics GET    /api/clinics/search(.:format)                       api/clinics#search
#      insert_api_clinics GET    /api/clinics/insert(.:format)                       api/clinics#insert
#             api_clinics GET    /api/clinics(.:format)                              api/clinics#index
#                         POST   /api/clinics(.:format)                              api/clinics#create
#          new_api_clinic GET    /api/clinics/new(.:format)                          api/clinics#new
#         edit_api_clinic GET    /api/clinics/:id/edit(.:format)                     api/clinics#edit
#              api_clinic GET    /api/clinics/:id(.:format)                          api/clinics#show
#                         PATCH  /api/clinics/:id(.:format)                          api/clinics#update
#                         PUT    /api/clinics/:id(.:format)                          api/clinics#update
#                         DELETE /api/clinics/:id(.:format)                          api/clinics#destroy
#              categories GET    /categories(.:format)                               categories#index
#                category GET    /categories/:id(.:format)                           categories#show
#                 clinics GET    /clinics(.:format)                                  clinics#index
#                  clinic GET    /clinics/:id(.:format)                              clinics#show
#                articles GET    /articles(.:format)                                 articles#index
#                 article GET    /articles/:id(.:format)                             articles#show
#                contacts POST   /contacts(.:format)                                 contacts#create
#            search_index GET    /search(.:format)                                   search#index
#                 privacy GET    /privacy(.:format)                                  information#privacy
#                 sitemap GET    /sitemap(.:format)                                  information#sitemap
#                 contact GET    /contact(.:format)                                  contacts#new
#
