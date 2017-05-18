Rails.application.routes.draw do
  root 'epicenter#feed'

  get 'all_users' => 'epicenter#all_users'

  get 'following' => 'epicenter#following'

  get 'followers' => 'epicenter#followers'

  get 'tag_tweets' => 'epicenter#tag_tweets'

  get 'show_user' => 'epicenter#show_user'

  get 'now_following' => 'epicenter#now_following'

  get 'unfollow' => 'epicenter#unfollow'



  resources :tweets
  devise_for :users
end
