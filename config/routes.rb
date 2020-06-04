Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    collection do
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get  'done'=>      'items#done', as: 'done'

      #商品購入のフロント実装コードレビュー確認のための仮ルーティングです。木下6/3
      get  'purchase_temporary'

    end
  end

  resources :credit_cards , only: [:new, :create, :destroy]

end
