# frozen_string_literal: true

Rails.application.routes.draw do
  resources :actors
  root to: 'top#index'
end
