Rails.application.routes.draw do

  root to: 'homes#top'
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  scope module: :public do

    get "books/search"

    get "books/category_search"

    resources :books, except: [:new, :edit] do

      resources :posts, only: [:create, :destroy]

    end

  end



  # 管理者用
  #URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


end
