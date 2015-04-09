Rails.application.routes.draw do
 #get "/categories", to: "categories#index", as: "categories"
 #get "/categories/new", to: "categories#new", as: "categories_new"
 #post "/categories", to: "categories#create", as: "categories_create"
 #get "/categories/:id/edit", to: "categories#edit", as: "categories_edit"
 #delete "/categories/:id", to: "categories#destroy", as: "categories_destroy"

 resources :categories
 resources :sub_categories
 resources :field_elements
 resources :fields
 
 post "/fields/options/", to: "fields#options"
 post "/categories/sub_categories/", to: "categories#sub_categories"
 get "/:slug_category/:slug_sub_category/", to: "forms#index"
end
