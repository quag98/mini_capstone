Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products_path" => "products#all_product_action"
    get "/products_single_path" => "products#single_product_action"
    get "/products_search_path" => "products#single_search_action"
    get "/products_search_path:id_number" => "products#single_search_action"
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end
