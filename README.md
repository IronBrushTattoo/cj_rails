<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Files</a>
<ul>
<li><a href="#sec-1-1">1.1. Gemfile</a></li>
<li><a href="#sec-1-2">1.2. database.yml</a></li>
</ul>
</li>
<li><a href="#sec-2">2. First steps</a></li>
<li><a href="#sec-3">3. Project</a>
<ul>
<li><a href="#sec-3-1">3.1. User Story</a></li>
<li><a href="#sec-3-2">3.2. Views</a>
<ul>
<li><a href="#sec-3-2-1">3.2.1. Routes</a></li>
<li><a href="#sec-3-2-2">3.2.2. Static Pages</a></li>
</ul>
</li>
<li><a href="#sec-3-3">3.3. Controllers</a>
<ul>
<li><a href="#sec-3-3-1">3.3.1. Pages</a></li>
</ul>
</li>
<li><a href="#sec-3-4">3.4. <span class="todo TODO">TODO</span> </a></li>
</ul>
</li>
</ul>
</div>
</div>

*Rails 4.2.6*

<https://github.com/IronBrushTattoo/cj_rails.git>

# Files<a id="sec-1" name="sec-1"></a>

## Gemfile<a id="sec-1-1" name="sec-1-1"></a>

<./Gemfile>

    source 'https://rubygems.org'
    
    gem 'rails', '4.2.6'
    gem 'pg', '~> 0.15'
    gem 'sass-rails', '~> 5.0'
    gem 'uglifier', '>= 1.3.0'
    gem 'coffee-rails', '~> 4.1.0'
    gem 'jquery-rails'
    gem 'turbolinks'
    gem 'jbuilder', '~> 2.0'
    gem 'sdoc', '~> 0.4.0', group: :doc
    
    group :development, :test do
      gem 'byebug'
    end
    
    group :development do
      gem 'web-console', '~> 2.0'
      gem 'spring'
    end

## database.yml<a id="sec-1-2" name="sec-1-2"></a>

<./config/database.yml>

# First steps<a id="sec-2" name="sec-2"></a>

    rake db:migrate
    rake db:setup

# Project<a id="sec-3" name="sec-3"></a>

The purpose of this application is produce several pdf files from an xlsx file,
as a re-implementation of <https://github.com/IronBrushTattoo/cj> as a web 
application.

## User Story<a id="sec-3-1" name="sec-3-1"></a>

-   user logs in
-   chooses xlsx file for upload
-   selects number of days back to make labels from
-   submits
    -   BACKGROUND
        -   cj-parser.rb does what it does&#x2026;
            -   [ ] rewrite in rails?
-   downloads sheets(pdf files)

## Views<a id="sec-3-2" name="sec-3-2"></a>

### Routes<a id="sec-3-2-1" name="sec-3-2-1"></a>

<./config/routes.rb>

    Rails.application.routes.draw do
      root 'pages#home'
    
      # The priority is based upon order of creation: first created -> highest priority.
      # See how all your routes lay out with "rake routes".
    
      # You can have the root of your site routed with "root"
      # root 'welcome#index'
    
      # Example of regular route:
      #   get 'products/:id' => 'catalog#view'
    
      # Example of named route that can be invoked with purchase_url(id: product.id)
      #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
    
      # Example resource route (maps HTTP verbs to controller actions automatically):
      #   resources :products
    
      # Example resource route with options:
      #   resources :products do
      #     member do
      #       get 'short'
      #       post 'toggle'
      #     end
      #
      #     collection do
      #       get 'sold'
      #     end
      #   end
    
      # Example resource route with sub-resources:
      #   resources :products do
      #     resources :comments, :sales
      #     resource :seller
      #   end
    
      # Example resource route with more complex sub-resources:
      #   resources :products do
      #     resources :comments
      #     resources :sales do
      #       get 'recent', on: :collection
      #     end
      #   end
    
      # Example resource route with concerns:
      #   concern :toggleable do
      #     post 'toggle'
      #   end
      #   resources :posts, concerns: :toggleable
      #   resources :photos, concerns: :toggleable
    
      # Example resource route within a namespace:
      #   namespace :admin do
      #     # Directs /admin/products/* to Admin::ProductsController
      #     # (app/controllers/admin/products_controller.rb)
      #     resources :products
      #   end
    end

### Static Pages<a id="sec-3-2-2" name="sec-3-2-2"></a>

    root 'pages#home'

3.3.1

1.  Home

    <./app/views/pages/home.html.erb>

## Controllers<a id="sec-3-3" name="sec-3-3"></a>

### Pages<a id="sec-3-3-1" name="sec-3-3-1"></a>

Static pages controller

    rails g controller pages --skip-assets

## TODO <a id="sec-3-4" name="sec-3-4"></a>

-   [ ] user authentication
-   [ ] file upload
    -   [ ] only xlsx file?
-   [ ] file storage
    -   [ ] archival api?
-   [ ]
