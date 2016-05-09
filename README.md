<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Config</a>
<ul>
<li><a href="#sec-1-1">1.1. Gemfile</a></li>
<li><a href="#sec-1-2">1.2. Gems</a></li>
<li><a href="#sec-1-3">1.3. Application</a></li>
<li><a href="#sec-1-4">1.4. Environments</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. Development</a></li>
<li><a href="#sec-1-4-2">1.4.2. Production</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-2">2. First steps</a></li>
<li><a href="#sec-3">3. Project</a>
<ul>
<li><a href="#sec-3-1">3.1. User Story</a></li>
<li><a href="#sec-3-2">3.2. File Upload</a>
<ul>
<li><a href="#sec-3-2-1">3.2.1. Dragonfly</a></li>
</ul>
</li>
<li><a href="#sec-3-3">3.3. File Conversion</a>
<ul>
<li><a href="#sec-3-3-1">3.3.1. xlsx processing</a></li>
<li><a href="#sec-3-3-2">3.3.2. pdf processing</a></li>
</ul>
</li>
<li><a href="#sec-3-4">3.4. Authentication</a>
<ul>
<li><a href="#sec-3-4-1">3.4.1. AuthO</a></li>
<li><a href="#sec-3-4-2">3.4.2. nb</a></li>
</ul>
</li>
<li><a href="#sec-3-5">3.5. Views</a>
<ul>
<li><a href="#sec-3-5-1">3.5.1. Routes</a></li>
<li><a href="#sec-3-5-2">3.5.2. Static Pages</a></li>
<li><a href="#sec-3-5-3">3.5.3. Labelsheets</a></li>
</ul>
</li>
<li><a href="#sec-3-6">3.6. Controllers</a>
<ul>
<li><a href="#sec-3-6-1">3.6.1. Pages</a></li>
<li><a href="#sec-3-6-2">3.6.2. Dashboard</a></li>
<li><a href="#sec-3-6-3">3.6.3. Labelsheets</a></li>
</ul>
</li>
<li><a href="#sec-3-7">3.7. Models</a>
<ul>
<li><a href="#sec-3-7-1">3.7.1. Page</a></li>
<li><a href="#sec-3-7-2">3.7.2. REMODEL::Labelsheet = Spreadsheet</a></li>
<li><a href="#sec-3-7-3">3.7.3. Labelsheet</a></li>
<li><a href="#sec-3-7-4">3.7.4. Label</a></li>
</ul>
</li>
<li><a href="#sec-3-8">3.8. Classes</a>
<ul>
<li><a href="#sec-3-8-1">3.8.1. LabelsheetPdf</a></li>
<li><a href="#sec-3-8-2">3.8.2. Label</a></li>
</ul>
</li>
<li><a href="#sec-3-9">3.9. DEPRECATIONS</a></li>
<li><a href="#sec-3-10">3.10. <span class="todo TODO">TODO</span> </a></li>
</ul>
</li>
<li><a href="#sec-4">4. Production</a>
<ul>
<li><a href="#sec-4-1">4.1. Heroku</a></li>
</ul>
</li>
</ul>
</div>
</div>

*Rails 4.2.6*

<https://github.com/IronBrushTattoo/cj_rails.git>
<../../Retail_Jewelry>

1  3.5 
3.5.3 

# Config<a id="sec-1" name="sec-1"></a>

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
    gem 'jquery-turbolinks'
    gem 'jbuilder', '~> 2.0'
    gem 'sdoc', '~> 0.4.0', group: :doc
    gem 'dragonfly', '~> 1.0.12'
    gem 'rack-cache', :require => 'rack/cache'
    gem "memcachier"
    gem 'dalli'
    gem 'kgio'
    gem 'prawn'
    gem 'prawn-table', '~> 0.2.2'
    gem 'roo', '~> 2.3.2'
    gem 'roo-xls'
    gem 'chronic', '~> 0.10.2'
    gem 'omniauth', '~> 1.3.1'
    gem 'omniauth-auth0', '~> 1.4.1'
    gem 'dotenv-rails', :groups => [:development, :test]
    
    group :development, :test do
      gem 'byebug'
    end
    
    group :development do
      gem 'web-console', '~> 2.0'
      gem 'spring'
    end
    
    group :production do
      gem 'rails_12factor'
    end

<./app/assets/javascripts/application.js>

    // This is a manifest file that'll be compiled into application.js, which will include all the files
    // listed below.
    //
    // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
    // or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
    //
    // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
    // compiled file.
    //
    // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
    // about supported directives.
    //
    //= require jquery
    //= require jquery.turbolinks
    //= require jquery_ujs
    //= require turbolinks
    //= require_tree .

## Gems<a id="sec-1-2" name="sec-1-2"></a>

3.2.1
3.3.2.1

## Application<a id="sec-1-3" name="sec-1-3"></a>

<./config/application.rb>

    require File.expand_path('../boot', __FILE__)
    
    require 'rails/all'
    
    # Require the gems listed in Gemfile, including any gems
    # you've limited to :test, :development, or :production.
    Bundler.require(*Rails.groups)
    
    module CaseJewelryRails
      class Application < Rails::Application
        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration should go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded.
    
        # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
        # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
        # config.time_zone = 'Central Time (US & Canada)'
    
        # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
        # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
        # config.i18n.default_locale = :de
    
        # Do not swallow errors in after_commit/after_rollback callbacks.
        config.active_record.raise_in_transactional_callbacks = true
    
        config.cache_store = :dalli_store
      end
    end

## Environments<a id="sec-1-4" name="sec-1-4"></a>

### Development<a id="sec-1-4-1" name="sec-1-4-1"></a>

<./config/environments/development.rb>

    Rails.application.configure do
      # Settings specified here will take precedence over those in config/application.rb.
    
      # In the development environment your application's code is reloaded on
      # every request. This slows down response time but is perfect for development
      # since you don't have to restart the web server when you make code changes.
      config.cache_classes = false
    
      config.cachestore = :memorystore
    
      # Do not eager load code on boot.
      config.eager_load = false
    
      # Show full error reports and disable caching.
      config.consider_all_requests_local       = true
      config.action_controller.perform_caching = true
    
      # Don't care if the mailer can't send.
      config.action_mailer.raise_delivery_errors = false
    
      # Print deprecation notices to the Rails logger.
      config.active_support.deprecation = :log
    
      # Raise an error on page load if there are pending migrations.
      config.active_record.migration_error = :page_load
    
      # Debug mode disables concatenation and preprocessing of assets.
      # This option may cause significant delays in view rendering with a large
      # number of complex assets.
      config.assets.debug = true
    
      # Asset digests allow you to set far-future HTTP expiration dates on all assets,
      # yet still be able to expire them through the digest params.
      config.assets.digest = true
    
      # Adds additional error checking when serving assets at runtime.
      # Checks for improperly declared sprockets dependencies.
      # Raises helpful error messages.
      config.assets.raise_runtime_errors = true
    
      # Raises error for missing translations
      # config.action_view.raise_on_missing_translations = true
    
      # OmniAuth.config.on_failure = Proc.new { |env|
      #   message_key = env['omniauth.error.type']
      #   error_description = Rack::Utils.escape(env['omniauth.error'].error_reason)
      #   new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}&error_description=#{error_description}"
      #   Rack::Response.new(['302 Moved'], 302, 'Location' => new_path).finish
      # }
    end

### Production<a id="sec-1-4-2" name="sec-1-4-2"></a>

<./config/environments/production.rb>

    Rails.application.configure do
      # Settings specified here will take precedence over those in config/application.rb.
    
      # Code is not reloaded between requests.
      config.cache_classes = true
    
      # Eager load code on boot. This eager loads most of Rails and
      # your application in memory, allowing both threaded web servers
      # and those relying on copy on write to perform better.
      # Rake tasks automatically ignore this option for performance.
      config.eager_load = true
    
      # Full error reports are disabled and caching is turned on.
      config.consider_all_requests_local       = false
      config.action_controller.perform_caching = true
    
      # Enable Rack::Cache to put a simple HTTP cache in front of your application
      # Add `rack-cache` to your Gemfile before enabling this.
      # For large-scale production use, consider using a caching reverse proxy like
      # NGINX, varnish or squid.
      config.action_dispatch.rack_cache = true
    
      # Disable serving static files from the `/public` folder by default since
      # Apache or NGINX already handles this.
      config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
      #config.serve_static_assets = true
    
      # Compress JavaScripts and CSS.
      config.assets.js_compressor = :uglifier
      # config.assets.css_compressor = :sass
    
      # Do not fallback to assets pipeline if a precompiled asset is missed.
      config.assets.compile = false
    
      # Asset digests allow you to set far-future HTTP expiration dates on all assets,
      # yet still be able to expire them through the digest params.
      config.assets.digest = true
    
      # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb
    
      # Specifies the header that your server uses for sending files.
      # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
      # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX
    
      # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
      # config.force_ssl = true
    
      # Use the lowest log level to ensure availability of diagnostic information
      # when problems arise.
      config.log_level = :debug
    
      # Prepend all log lines with the following tags.
      # config.log_tags = [ :subdomain, :uuid ]
    
      # Use a different logger for distributed setups.
      # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)
    
      # Use a different cache store in production.
      # config.cache_store = :mem_cache_store
    
      # Enable serving of images, stylesheets, and JavaScripts from an asset server.
      # config.action_controller.asset_host = 'http://assets.example.com'
    
      # Ignore bad email addresses and do not raise email delivery errors.
      # Set this to true and configure the email server for immediate delivery to raise delivery errors.
      # config.action_mailer.raise_delivery_errors = false
    
      # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
      # the I18n.default_locale when a translation cannot be found).
      config.i18n.fallbacks = true
    
      # Send deprecation notices to registered listeners.
      config.active_support.deprecation = :notify
    
      # Use default logging formatter so that PID and timestamp are not suppressed.
      config.log_formatter = ::Logger::Formatter.new
    
      # Do not dump schema after migrations.
      config.active_record.dump_schema_after_migration = false
    
      OmniAuth.config.on_failure = Proc.new { |env|
        message_key = env['omniauth.error.type']
        error_description = Rack::Utils.escape(env['omniauth.error'].error_reason)
        new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}&error_description=#{error_description}"
        Rack::Response.new(['302 Moved'], 302, 'Location' => new_path).finish
      }
    
      client = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                                 :username => ENV["MEMCACHIER_USERNAME"],
                                 :password => ENV["MEMCACHIER_PASSWORD"],
                                 :failover => true,
                                 :socket_timeout => 1.5,
                                 :socket_failure_delay => 0.2,
                                 :value_max_bytes => 10485760)
      config.action_dispatch.rack_cache = {
        :metastore    => client,
        :entitystore  => client
      }
      config.static_cache_control = "public, max-age=2592000"
    
    end

3.4.1

# First steps<a id="sec-2" name="sec-2"></a>

    rake db:migrate
    rake db:setup

# Project<a id="sec-3" name="sec-3"></a>

The purpose of this application is to produce several pdf files from an xlsx file,
as a re-implementation of <https://github.com/IronBrushTattoo/cj> as a web 
application.

## User Story<a id="sec-3-1" name="sec-3-1"></a>

-   user logs in (3.4)
-   chooses xlsx file for upload
    3.2
-   selects number of days back to make labels from
-   submits
    -   BACKGROUND
        -   cj-parser.rb does what it does&#x2026;
            -   [ ] rewrite in rails?
-   downloads sheets(pdf files)

## File Upload<a id="sec-3-2" name="sec-3-2"></a>

-   possible gems
    <https://www.ruby-toolbox.com/categories/rails_file_uploads>
    -   paperclip
        -   nb
            -   used paperclip before
            -   seemed to be designed specifically for image files
            -   always worked well
    -   carrierwave
        -   nb
            -   used before, but not thoroughly
                -   i kind of remember having issues with it
    -   dragonfly
        <https://github.com/markevans/dragonfly>
        <http://markevans.github.io/dragonfly/>
        <http://markevans.github.io/dragonfly/rails/>
        
        Dragonfly is a highly customizable ruby gem for handling images and other
        attachments and is already in use on thousands of websites
        
        3.2.1
        
        -   nb
            -   used briefly before
                -   i remember it being an easy configuration
    -   attachment fu
        <https://github.com/technoweenie/attachment_fu>
        
        Treat an ActiveRecord model as a file attachment, storing its patch, size,
        content type, etc. <http://weblog.technoweenie.net>
        
        -   nb
            -   has not been maintained since Apr 25, 2009
    -   refile
        -   nb
            -   was my next choice when previously working with file uploads
    -   jquery.fileupload-rails
    -   imagery
    -   attached
    -   papermill
    -   fileuploader-rails
    -   filecip
    -   simple-image-uploader

### Dragonfly<a id="sec-3-2-1" name="sec-3-2-1"></a>

<http://markevans.github.io/dragonfly/rails/>

1.  Setup

    -   [X] gem 'dragonfly', '~> 1.0.12'
        -   [X] modify 1
        
        -   [X] bundle install
    
    -   [ ] rails g dragonfly
        
        generates config/initializers/dragonfly.rb
        
        <./config/initializers/dragonfly.rb>
        
            require 'dragonfly'
            
            # Configure
            Dragonfly.app.configure do
              plugin :imagemagick
            
              secret "<%= Rails.application.secrets.dragonfly_secret %>"
            
              url_format "/media/:job/:name"
            
              datastore :file,
                root_path: Rails.root.join('public/system/dragonfly', Rails.env),
                server_root: Rails.root.join('public')
            end
            
            # Logger
            Dragonfly.logger = Rails.logger
            
            # Mount as middleware
            Rails.application.middleware.use Dragonfly::Middleware
            
            # Add model functionality
            if defined?(ActiveRecord::Base)
              ActiveRecord::Base.extend Dragonfly::Model
              ActiveRecord::Base.extend Dragonfly::Model::Validations
            end
        
        -   [ ] MOVE SECRET to ENV

2.  Handling attachments

    -   Labelsheet model 
        
        Model: *Labelsheet*
        
        3.7.3
        
        <./db/migrate>
        
        -   [-] create Labelsheet
            
                rails g scaffold Labelsheet days:integer file_uid:string file_name:string
            
                rake db:migrate
            
            -   [-] check for coffee and scaffold files
                -   [X] coffee
                    -   [X] rm
                -   [X] scaffold.scss
                    -   [X] rm
                -   [ ] look into scaffold configuration
        
        -   [X] add *file* attribute to Labelsheet
            
            3.7.3
            
            <./app/models/labelsheet.rb>
            
                class Labelsheet < ActiveRecord::Base
                  dragonfly_accessor :file  # defines a reader/writer for file
                  # ...
                end
        
        -   [X] update 3.5.1
            
                resources :labelsheets
                get "labelsheets" => "labelsheets#new"
        
        -   [ ] update for Labelsheet references
        
        -   [X] view for uploading
            
            3.5
            
            <./app/views/labelsheets/_form.html.erb>
            
                <% form_for @labelsheet do |f| %>
                  ...
                  <%= f.file_field :file %>
                  ...
                <% end %>
        
        -   [X] Remodel SpreadsheetPdf to LabelsheetPdf
            
            30
        
        -   [X] allow parameter *file* to be accepted by the controller
            
            <./app/controllers/labelsheets_controller.rb>
            
            3.5.3
            
                class SpreadsheetsController < SecuredController
                  before_action :set_spreadsheet, only: [:show, :edit, :update, :destroy]
                  before_action :logged_in_using_omniauth?, only: [:new, :edit, :update, :destroy]
                
                  def index
                    @spreadsheets = Spreadsheet.all
                  end
                
                  def show
                    @spreadsheet = Spreadsheet.find(params[:id])
                    respond_to do |format|
                      format.html
                      format.pdf do
                        pdf = SpreadsheetPdf.new(@spreadsheet, view_context)
                        send_data pdf.render,
                                  filename: "spreadsheet_#{@spreadsheet.created_at.strftime("%d/%m/%Y")}.pdf",
                                  type: "application/pdf",
                                  disposition: "inline"
                      end
                    end
                  end
                
                  def new
                    @spreadsheet = Spreadsheet.new
                  end
                
                  def edit
                  end
                
                  def create
                    @spreadsheet = Spreadsheet.new(spreadsheet_params)
                
                    respond_to do |format|
                      if @spreadsheet.save
                        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully created.' }
                        format.json { render :show, status: :created, location: @spreadsheet }
                      else
                        format.html { render :new }
                        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
                      end
                    end
                  end
                
                  def update
                    respond_to do |format|
                      if @spreadsheet.update(spreadsheet_params)
                        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully updated.' }
                        format.json { render :show, status: :ok, location: @spreadsheet }
                      else
                        format.html { render :edit }
                        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
                      end
                    end
                  end
                
                  def destroy
                    @spreadsheet.destroy
                    respond_to do |format|
                      format.html { redirect_to spreadsheets_url, notice: 'Spreadsheet was successfully destroyed.' }
                      format.json { head :no_content }
                    end
                  end
                
                  private
                  def set_spreadsheet
                    @spreadsheet = Spreadsheet.find(params[:id])
                  end
                
                  def spreadsheet_params
                    params.require(:spreadsheet).permit(:index, :file, :days)
                  end
                end
            
            -   nb
                
                3.3.2.1
                3.3.2.1.2.1
        
        -   [X] view for displaying
            
            3.5
            
            <./app/views/labelsheets/show.html.erb>
            <./app/views/labelsheets/index.html.erb>
            
                <%= @labelsheet.file_name if @labelsheet.file_stored? %>
        
        -   more can be done with [models](http://markevans.github.io/dragonfly/models)

3.  Caching

    -   [X] 1
        
            gem 'rack-cache', :require => 'rack/cache'
        
        -   [X] bundle install
    
    -   [X] uncomment in 1.4.2
        
            config.action_dispatch.rack_cache = true

4.  Custom Endpoints

    3.5.1
    
    -   [ ] text generation example
        
            get "text/:text" => Dragonfly.app.endpoint { |params, app|
              app.generate(:text, params[:text], 'font-size' => 42)
            }
    
    -   [ ] endpoint callable from javascript (e.g. /image?file=egg.png&size=30x30)
        
            get "image" => Dragonfly.app.endpoint { |params, app|
              app.fetch_file("some/dir/#{params[:file]}").thumb(params[:size])
            }

5.  Using Another Data Store

    <http://www.sitepoint.com/file-uploads-dragonfly/>
    
    -   [ ] add <./public/system/dragonfly> to <./.gitignore>
        
            # See https://help.github.com/articles/ignoring-files for more about ignoring files.
            #
            # If you find yourself ignoring temporary files generated by your text editor
            # or operating system, you probably want to add a global ignore instead:
            #   git config --global core.excludesfile '~/.gitignore_global'
            
            # Ignore bundler config.
            /.bundle
            
            # Ignore all logfiles and tempfiles.
            /log/*
            !/log/.keep
            /tmp
            
            /public/system/dragonfly

## File Conversion<a id="sec-3-3" name="sec-3-3"></a>

### xlsx processing<a id="sec-3-3-1" name="sec-3-3-1"></a>

1.  Roo

    <https://github.com/roo-rb/roo>
    <https://github.com/roo-rb/roo-xls>
    
    -   [X] 1
        
            gem 'roo', '~> 2.3.2'
            gem 'roo-xls'
        
        -   [X] bundle install
    
    -   [ ] examine code from native application
        
        <file:///home/son/IBT/jewelry/Retail_Jewelry/cj-parser.rb>
        
            : require 'roo'
            : 
            : def get_labels(file)
            :   puts "getting labels"
            :   
            :   labels = []
            :   
            :   xls_file = Roo::Spreadsheet.open(file)
            : 
            :   xls_file.sheets.each do |sheet|
            : 
            :     sheet = xls_file.sheet(sheet)
            :     
            :     sheet.parse[4..-1].each do |row|
            : 
            :       zero,one,two,four,five,ten = nil_convert(row[0]),
            :       nil_convert(row[1]),
            :       nil_convert(row[2]),
            :       nil_convert(row[4]),
            :       nil_convert(row[5]),
            :       nil_convert(row[10])
            : 
            :       sizes = strip(five.to_s)
            :       gauge = "#{sizes[0]}g"
            :       size = "#{sizes[1]}\""
            :       desc = two.gsub("&", "and")
            :       id = one.to_s.split(/-/)[0]
            :       price = "$#{four.to_s.split(".")[0]}"
            :       supply = five
            :       updated = Chronic.parse(ten).to_f
            : 
            :       label = Label.new(gauge,
            :                         size,
            :                         desc,
            :                         id,
            :                         price,
            :                         supply,
            :                         updated
            :                        )
            : 
            :       seconds = 60*60*24*$days
            :       
            :       if (Time.now.to_f - updated.to_f) < seconds
            :         puts label.id
            :         $labelID = label.id
            :         labels.push label
            :       end
            : 
            :     end
            :   end
            : 
            :   return labels
            : 
            : end

### pdf processing<a id="sec-3-3-2" name="sec-3-3-2"></a>

1.  Prawn

    <https://github.com/prawnpdf/prawn>
    
    1.  Setup
    
        -   [X] 1
        
            #gem 'prawn', '~> 2.1'
            gem 'prawn'
        
        -   [X] bundle install
        
        1.  Manual
        
            <http://prawnpdf.org/manual.pdf>
            
            -   [X] clone repository
                
                    git clone https://github.com/prawnpdf/prawn
            
            -   [ ] switch to the stable branch 
                
                    git branch stable
            
            -   [X] bundle install
            
            -   [ ] bundle exec rake manual
                generates *manual.pdf* in the project root
    
    2.  Tutorials
    
        1.  Creating PDF Using Prawn in Ruby on Rails
        
            <http://www.idyllic-software.com/blog/creating-pdf-using-prawn-in-ruby-on-rails/>
            
            -   [X] 1
                
                    gem 'prawn'
                    bundle install
            
            -   [X] <./config/initializers/mime_types.rb>
                
                create a PDF Mime::Type inside mime<sub>types</sub>.rb
                
                    # Be sure to restart your server when you modify this file.
                    
                    # Add new mime types for use in respond_to blocks:
                    # Mime::Type.register "text/richtext", :rtf
                    
                    Mime::Type.register "application/pdf", :pdf
            
            -   [X] <./app/controllers/spreadsheets_controller.rb>
                
                
                
                <http://www.idyllic-software.com/blog/creating-pdf-using-prawn-in-ruby-on-rails/>
                
                    class InvoicesController < ApplicationController
                    
                      before_filter :authenticate_customer!, :only => [:index, :show]
                    
                      def index
                        @invoices = Invoice.all_invoices(current_customer)
                      end
                    
                      def show
                        @invoice = Invoice.find(params[:id])
                        respond_to do |format|
                          format.html
                          format.pdf do
                            pdf = InvoicePdf.new(@invoice, view_context)
                            send_data pdf.render, filename: 
                              "invoice_#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
                              type: "application/pdf"
                          end
                        end
                      end
                    
                    end
                
                -   [X] open pdf in browser instead of download
                    
                    add /disposition: "inline"/ after type
            
            -   [X] create a new class **app/pdfs/spreadsheet<sub>pdf</sub>**
            
            -   [X] restart server
            
            -   [X] set the *@spreadsheet* and *view<sub>context</sub>*
                
                    def initialize(spreadsheet, view)
                      super()
                      @spreadsheet = spreadsheet
                      @view = view
                      text "Spreadsheet #{@spreadsheet.id}"
                    end
            
            -   [ ] create different methods inside as per what you want to show on the pdf
                -   example
                    
                        def logo
                          logopath = "#{Rails.root}/app/assets/images/logo.png"
                          image logopath, :width => 197, :height => 91
                        end
            
            1.  Issues
            
                -   [ ] NameError (uninitialized constant SpreadsheetsController::SpreadsheetPdf)

2.  nb

    <https://rubygems.org/search?utf8=%E2%9C%93&query=latex>
    <http://www.sitepoint.com/hackable-pdf-typesetting-in-ruby-with-prawn/>
    
    <https://github.com/prawnpdf/prawn>
    
    3.3.2.1 is active and looks rad!
    
    -   outdated but possibly useful
        
        <https://github.com/baierjan/rails-latex>
        <https://github.com/bruce/rtex>

## Authentication<a id="sec-3-4" name="sec-3-4"></a>

### AuthO<a id="sec-3-4-1" name="sec-3-4-1"></a>

<https://manage.auth0.com/#/>
<https://manage.auth0.com/#/applications/eD2I5SEBmvgx3tEzeFd35mJfvW5HkasK/quickstart>

-   [X] 1. Add dependencies
    
    1
    
        gem 'omniauth', '~> 1.3.1'
        gem 'omniauth-auth0', '~> 1.4.1'
    
    -   [X] bundle install

-   [X] 2. Initialize Omniauth AuthO
    
    <./config/initializers/auth0.rb>
    
        Rails.application.config.middleware.use OmniAuth::Builder do
          provider(
            :auth0,
            ENV["AUTH0_CLIENT_ID"],
            ENV["AUTH0_CLIENT_SECRET"],
            ENV["AUTH0_DOMAIN"],
            callback_path: "/auth/auth0/callback"
          )
        end
    
    -   [X] add to gitignore?
        
        <./.gitignore>
        
        -   [X] dotenv
            
            1
            
                gem 'dotenv-rails', :groups => [:development, :test]

-   [X] 3. Add the AuthO callback handler
    
        rails g controller auth0 callback failure --skip-template-engine --skip-assets
    
    <./app/controllers/auth0_controller.rb>
    
        class Auth0Controller < ApplicationController
          def callback
            # This stores all the user information that came from Auth0 and the IdP
            session[:userinfo] = request.env['omniauth.auth']
        
            # Redirect to the URL you want after successful auth
            redirect_to '/labelsheets'
          end
        
          def failure
            # show a failure page or redirect to an error page
            @error_msg = request.params['message']
          end
        end
    
    -   [X] replace the generated routes in <./config/routes.rb> 
        
        3.5.1
        
            get "/auth/auth0/callback" => "auth0#callback"
            get "/auth/failure" => "auth0#failure"

-   [X] 4. Specify the callback on AuthO Dashboard
    
    For security purposes, register callback URL of the application at
    <https://manage.auth0.com/#/applications> 
    
        http://yourUrl/auth/auth0/callback

-   [X] 5. Triggering login manually or integrating the AuthOLock
    -   [ ] modal all (see auth0 dashboard apps quickstart)
    
    -   [X] passwordless - Email Code
        
        <./app/views/layouts/application.html.erb>
        
            <!DOCTYPE html>
            <html>
            <head>
              <title>CaseJewelryRails</title>
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <%= yield :cdn_code %>
              <%= stylesheet_link_tag    '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css' %>
              <%= stylesheet_link_tag    '//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css' %>
            
              <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
              <%= javascript_include_tag '//cdn.auth0.com/js/lock-9.0.min.js' %>
              <%#= javascript_include_tag '//use.typekit.net/iws6ohy.js' %>
              <!--<script type="text/javascript">try{Typekit.load();}catch(e){}</script>-->
            
              <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
              <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
              <%= csrf_meta_tags %>
            </head>
            <body>
            
            <%= yield %>
            
            </body>
            </html>
        
        <./app/assets/javascripts/home.js.erb>
        
            var lock = new Auth0Lock("<%= Rails.application.secrets.auth0_client_id %>", "<%= Rails.application.secrets.auth0_domain %>");
            function signin() {
              console.log("<%= Rails.application.secrets.auth0_callback_url %>");
              lock.show({
                //callbackURL: "http://bacf7d22.ngrok.io/auth/auth0/callback", //"<%= Rails.application.secrets.auth0_callback_url %>",
                callbackURL: "<%= Rails.application.secrets.auth0_callback_url %>",
                responseType: 'code', 
                authParams: {
                  scope: 'openid name email picture'
                }
              });
            }
        
        <./config/secrets.yml>
        
            # Be sure to restart your server when you modify this file.
            
            # Your secret key is used for verifying the integrity of signed cookies.
            # If you change this key, all old signed cookies will become invalid!
            
            # Make sure the secret is at least 30 characters and all random,
            # no regular words or you'll be exposed to dictionary attacks.
            # You can use `rake secret` to generate a secure secret key.
            
            # Make sure the secrets in this file are kept private
            # if you're sharing your code publicly.
            
            development:
              secret_key_base: bea023fad0c0803893cde72b419aa08fc9d7456bedeaf9b5490c4c2ef34de64bd1eee9ca4583a19f5f206a36b750bd41a85dcf95567718099ae827ee1d1fcc18
              auth0_client_id: <%= ENV["AUTH0_CLIENT_ID"] %>
              auth0_client_secret: <%= ENV["AUTH0_CLIENT_SECRET"] %>
              auth0_domain: <%= ENV["AUTH0_DOMAIN"] %>
              auth0_callback_url: <%= ENV["AUTH0_CALLBACK_URL"] %>
            
            
            test:
              secret_key_base: 932c75a9b0d799c43e825634b7c2a94fc48ca57bc02db62353a6a51211f9818c4b84105cb15e815de487c59106cc25982c31f95238fd184af8a97003a55c08b4
              auth0_client_id: <%= ENV["AUTH0_CLIENT_ID"] %>
              auth0_client_secret: <%= ENV["AUTH0_CLIENT_SECRET"] %>
              auth0_domain: <%= ENV["AUTH0_DOMAIN"] %>
              auth0_callback_url: <%= ENV["AUTH0_CALLBACK_URL"] %>
            
            # Do not keep production secrets in the repository,
            # instead read values from the environment.
            production:
              secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
              auth0_client_id: <%= ENV["AUTH0_CLIENT_ID"] %>
              auth0_client_secret: <%= ENV["AUTH0_CLIENT_SECRET"] %>
              auth0_domain: <%= ENV["AUTH0_DOMAIN"] %>
              auth0_callback_url: <%= ENV["AUTH0_CALLBACK_URL"] %>
        
        update 3.5.1

-   [ ] 6. Accessing user information
    
    <./app/controllers/secured_controller.rb>
    
        class SecuredController < ApplicationController
        
          before_action :logged_in_using_omniauth?
        
          private
        
          def logged_in_using_omniauth?
            unless session[:userinfo].present?
              redirect_to '/'
            end
          end
        
        end
    
    via *userinfo* stored in the session on step 3
    
        class DashboardController < SecuredController
          def show
            @user = session[:userinfo]
          end
        end
    
        <div>
          <img class="avatar" src="<%= @user[:info][:image] %>"/>
          <h2>Welcom <%= @user[:info][:name] %></h2>
        </div>
    
    <./config/initializers/session_store.rb>
    
        # Be sure to restart your server when you modify this file.
        
        #Rails.application.config.session_store :cookie_store, key: '_CaseJewelryRails_session'
        Rails.application.config.session_store :cache_store
    
    <./config/environments/development.rb>
    
        config.cachestore = :memorystore
    
    <./app/views/dashboard/show.html.erb>
    
        <div class="home">
            <div class="container">
                <div class="login-page clearfix">
                  <div class="logged-in-box auth0-box logged-in">
                    <h1 id="logo"><img src="//cdn.auth0.com/samples/auth0_logo_final_blue_RGB.png" /></h1>
                    <img class="avatar" src="<%= @user[:info][:image] %>"/>
                    <h2>Welcome <%= @user[:info][:name] %></h2>
                    <pre><%= JSON.pretty_generate(@user[:info]) %></pre>
                  </div>
                </div>
            </div>
        </div>
    
    <./app/views/home/show.html.erb>
    
        <div class="home">
            <div class="container">
                <div class="login-page clearfix">
                  <div class="login-box auth0-box before">
                    <img src="https://i.cloudup.com/StzWWrY34s.png" />
                    <h3>Auth0 Example</h3>
                    <p>Zero friction identity infrastructure, built for developers</p>
                    <a class="btn btn-primary btn-lg btn-login btn-block" onclick="signin()">SignIn</a>
                  </div>
                </div>
            </div>
        </div>
    
    3.6.2
    3.6.1

-   [ ] Troubleshooting
    -   [ ] "We're sorry, we can't send you the email&#x2026;
        
        [auth0 in development](https://www.google.com/search?q=auth0+in+development&oq=auth0+in+development&aqs=chrome..69i57.6898j0j7&sourceid=chrome&es_sm=122&ie=UTF-8)
        
        <https://auth0.com/docs/lifecycle>
        <https://auth0.com/docs/local-testing-and-development>
        
        If you need to develop an application locally, it's possible to use
        localhost or other domains which Auth0 cannot access (e.g. intranets) 
        as callback URLs. Since Auth0 uses OpenID Connect as its main identity 
        protocol, it never makes a call directly to your application's server. 
        Instead, it redirects users in a browser to an endpoint of your 
        application (which must be listed in the "Allowed Callback URLs" list) 
        with specific information in the query string or hash fragment, 
        depending on the type of application.
        
        <https://auth0.com/docs/protocols>
        
        <file:///home/son/IBT/jewelry/rails/docs/omniauth-auth0-sample/>
    
    -   [ ] get error description on failure
        
        <./config/environments/production.rb>
        
            OmniAuth.config.on_failure = Proc.new { |env|
              message_key = env['omniauth.error.type']
              error_description = Rack::Utils.escape(env['omniauth.error'].error_reason)
              new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}&error_description=#{error_description}"
              Rack::Response.new(['302 Moved'], 302, 'Location' => new_path).finish
            }
        
        1
        1.4
        1.4.2

### nb<a id="sec-3-4-2" name="sec-3-4-2"></a>

-   oauth?
    -   login with familiar accounts
        -   google, fb, twitter, etc

## Views<a id="sec-3-5" name="sec-3-5"></a>

### Routes<a id="sec-3-5-1" name="sec-3-5-1"></a>

<./config/routes.rb>

    Rails.application.routes.draw do
      #resources :spreadsheets
      #get "spreadsheets" => "spreadsheets#new"
      resources :labelsheets
      get "labelsheets" => "labelsheets#new"
    
      get 'dashboard/show'
    
      get "/" => "home#show"
    
      get "/dashboard" => "dashboard#show"
    
      get "/auth/auth0/callback" => "auth0#callback"
      get "/auth/failure" => "auth0#failure"
    end

3.6.1
3.4.1
3.2.1.4

### Static Pages<a id="sec-3-5-2" name="sec-3-5-2"></a>

    root 'pages#home'

3.6.1

1.  Home

    <./app/views/pages/home.html.erb>

### Labelsheets<a id="sec-3-5-3" name="sec-3-5-3"></a>

<./app/views/labelsheets/>

1.  Form

    <./app/views/labelsheets/_form.html.erb>
    
        <%= form_for(@labelsheet) do |f| %>
          <% if @labelsheet.errors.any? %>
            <div id="error_explanation">
              <h2><%= pluralize(@labelsheet.errors.count, "error") %> prohibited this labelsheet from being saved:</h2>
        
              <ul>
              <% @labelsheet.errors.full_messages.each do |message| %>
                <li><%= message %></li>
              <% end %>
              </ul>
            </div>
          <% end %>
        
          <div class="field">
            <%= f.label :days %><br>
            <%= f.number_field :days %>
          </div>
        
          <div class="field">
            <%= f.label :file %><br>
            <%= f.file_field :file %>
          </div>
        
          <div class="actions">
            <%= f.submit %>
          </div>
        <% end %>

2.  Show

    <./app/views/labelsheets/show.html.erb>
    
        <p id="notice"><%= notice %></p>
        
        <p>
          <strong>Index:</strong>
          <%= @labelsheet.file_name if @labelsheet.file_stored? %>
          <%= link_to 'PDF', "#{@labelsheet.id}.pdf" %>
        </p>
        
        <%= link_to 'Edit', edit_labelsheet_path(@labelsheet) %> |
        <%= link_to 'Back', labelsheets_path %>

3.  Index

    <./app/views/labelsheets/index.html.erb>
    
        <p id="notice"><%= notice %></p>
        
        <h1>Listing Labelsheets</h1>
        
        <table>
          <thead>
            <tr>
              <th>Index</th>
              <th colspan="3"></th>
            </tr>
          </thead>
        
          <tbody>
            <% @labelsheets.each do |labelsheet| %>
              <tr>
                <td><%= link_to 'Show', labelsheet %></td>
                <td><%= link_to 'Edit', edit_labelsheet_path(labelsheet) %></td>
                <td><%= link_to 'Destroy', labelsheet, method: :delete, data: { confirm: 'Are you sure?' } %></td>
              </tr>
            <% end %>
          </tbody>
        </table>
        
        <br>
        
        <%= link_to 'New Labelsheet', new_labelsheet_path %>

## Controllers<a id="sec-3-6" name="sec-3-6"></a>

### Pages<a id="sec-3-6-1" name="sec-3-6-1"></a>

Static pages controller

    rails g controller pages --skip-assets

<./app/controllers/pages_controller.rb>

    class PagesController < ApplicationController
    end

-   nb
    
    3.4.1

### Dashboard<a id="sec-3-6-2" name="sec-3-6-2"></a>

    rails g controller Dashboard show

<./app/controllers/dashboard_controller.rb>

    class DashboardController < SecuredController
      def show
        @user = session[:userinfo]
      end
    end

### Labelsheets<a id="sec-3-6-3" name="sec-3-6-3"></a>

<./app/controllers/labelsheets_controller.rb>

    class LabelsheetsController < SecuredController
      before_action :set_labelsheet, only: [:show, :edit, :update, :destroy]
      before_action :logged_in_using_omniauth?, only: [:new, :edit, :update, :destroy]
    
      def index
        @labelsheets = Labelsheet.all
      end
    
      def show
        @labelsheet = Labelsheet.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            pdf = LabelsheetPdf.new(@labelsheet, view_context)
            send_data pdf.render,
                      filename: "labelsheet_#{@labelsheet.created_at.strftime("%d/%m/%Y")}.pdf",
                      type: "application/pdf",
                      disposition: "inline"
          end
        end
      end
    
      def new
        @labelsheet = Labelsheet.new
      end
    
      def edit
      end
    
      def create
        @labelsheet = Labelsheet.new(labelsheet_params)
    
        respond_to do |format|
          if @labelsheet.save
            format.html { redirect_to @labelsheet, notice: 'Labelsheet was successfully created.' }
            format.json { render :show, status: :created, location: @labelsheet }
          else
            format.html { render :new }
            format.json { render json: @labelsheet.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def update
        respond_to do |format|
          if @labelsheet.update(labelsheet_params)
            format.html { redirect_to @labelsheet, notice: 'Labelsheet was successfully updated.' }
            format.json { render :show, status: :ok, location: @labelsheet }
          else
            format.html { render :edit }
            format.json { render json: @labelsheet.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @labelsheet.destroy
        respond_to do |format|
          format.html { redirect_to labelsheets_url, notice: 'Labelsheet was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
      def set_labelsheet
        @labelsheet = Labelsheet.find(params[:id])
      end
    
      def labelsheet_params
        params.require(:labelsheet).permit(:index, :file, :days)
      end
    end

## Models<a id="sec-3-7" name="sec-3-7"></a>

3.5.1

### Page<a id="sec-3-7-1" name="sec-3-7-1"></a>

### REMODEL::Labelsheet = Spreadsheet<a id="sec-3-7-2" name="sec-3-7-2"></a>

<./app/models/spreadsheet.rb>

    class Spreadsheet < ActiveRecord::Base
      dragonfly_accessor :file  # defines a reader/writer for file
    end

-   [ ] DEPRECATION
    -   [ ] rm spreadsheet model

### Labelsheet<a id="sec-3-7-3" name="sec-3-7-3"></a>

<./app/models/labelsheet.rb>

    class Labelsheet < ActiveRecord::Base
      dragonfly_accessor :file 
    end

### Label<a id="sec-3-7-4" name="sec-3-7-4"></a>

## Classes<a id="sec-3-8" name="sec-3-8"></a>

### LabelsheetPdf<a id="sec-3-8-1" name="sec-3-8-1"></a>

<./app/pdfs/labelsheet_pdf.rb>

nb: possibly break this chunker down into other modules, classes, helpers, etc

    class LabelsheetPdf < Prawn::Document
    
      def initialize(labelsheet, view)
        super()
        @labelsheet = labelsheet
        file_path = "public/system/dragonfly/development"
        xls_file = get_labels("#{file_path}/#{@labelsheet.file_uid}")
        @view = view
    
        make_labels(xls_file)
    
      end
    
      def desc_box(desc)
        formatted_text_box [
          {
            text: "#{desc}",
            color: "ffffff",
            styles: [:italic],
            size: 11
          }
        ], at: [$padding,$top], width: $text_width
      end
    
      def size_box(gauge,size)
        transparent(0.1) do
          stroke_rectangle [0, $box_height+$padding], $box_width, $box_height*0.75
        end
    
        transparent(0.6) do
          formatted_text_box [
            {
              text: "#{gauge} #{size}",
              color: "ffffff",
              size: 15,
              styles: [:normal],
              character_spacing: 0.5
            }
          ], at: [($box_width/2)-$padding,$mid], width: $text_width
        end
    
      end
    
      def id_box(id)
        formatted_text_box [
          {
            text: "#{id}",        
            color: "ffffff",
            align: :left
          }
        ], at: [$padding,$low], width: $text_width
      end
    
      def price_box(price)
        formatted_text_box [
          {
            text: "#{price}",
            color: "ffffff",
            align: :right,
            styles: [:italic]
          }
        ], at: [$box_width-($padding*3),$low], width: $text_width
      end
    
      def make_labels(file)
    
        define_grid(:columns => 4, :rows => 8, :row_gutter => 10, :column_gutter => 0)
        margin = 14
    
        count = 1
        row = 0
        column = 0
    
        start_new_page(:margin => margin)
    
        file.each do |label|
    
          grid(row, column).bounding_box do
            #stroke_axis
    
            fill_color "000000"
            stroke_color "ffffff"
    
            $box_width = 144
            $box_height = 81
            $padding = 12
            $text_width = 90
            $top = $box_height-$padding
            $mid = $top - 30
            $low = $mid - 20
    
            transparent(0.9) do
              fill_rectangle [0, $box_height], $box_width, $box_height
    
              font "Times-Roman", :size => 10
    
              desc_box(label.desc)
              size_box(label.gauge, label.size)
              id_box(label.id)
              price_box(label.price)
            end
    
          end
    
          if count%4 == 0
            row+=1
            column = 0
          else
            column+=1
          end
    
          if count%32 == 0
            start_new_page(:margin => margin)
            row = 0
            column = 0
          end
    
          count+=1
        end
    
      end
    
      def logo
        logopath = "#{Rails.root}/app/assets/images/logo.png"
        image logopath, :width => 197, :height => 197
      end
    
      def get_labels(file)
    
        labels = []
    
        xls_file = Roo::Spreadsheet.open(file, extension: :xls)
    
        xls_file.sheets.each do |sheet|
    
          sheet = xls_file.sheet(sheet)
    
          #sheet.parse[0..-1].each do |row|
          sheet.each do |row|
          # sheet.each(
          #   sizes: 'Size',
          #   desc: 'Description',
          #   id: 'Product ID',
          #   price: 'Retail',
          #   updated: 'Last Edit Date') do |row|
          #sheet.parse.each do |row|
          #sheet.parse( header_search: [/Size/,/Description/,/Product ID/,/Retail/,/Last Edit Date/],
          # sheet.parse(header_search: [/Size/,/Description/,/Product ID/,/Retail/,/Last Edit Date/]).each(
          #   sizes: 'Size',
          #   desc: 'Description',
          #   id: 'Product ID',
          #   price: 'Retail',
          #   updated: 'Last Edit Date'
          # ) do |row|
          #).each do |row|
    
            id, desc, price, sizes, updated = row[6], row[2], row[3], row[4], row[12]
    
            sizes = strip(nil_convert(sizes).to_s)
            gauge = "#{sizes[0]}g" unless sizes[0].nil?
            size = "#{sizes[1]}\"" unless sizes[1].nil?
            desc = nil_convert(desc).gsub("&", "and")
            id = nil_convert(id).to_s.split(/-/)[0]
            price = "$#{nil_convert(price).to_s.split(".")[0]}"
            updated = Chronic.parse(nil_convert(updated)).to_f
    
            label = Label.new(gauge,
                              size,
                              desc,
                              id,
                              price,
                              updated
                             )
    
            seconds = 60*60*24*@labelsheet.days.to_f
    
            if (Time.now.to_f - updated.to_f) < seconds
              #puts label.id
              $labelID = label.id
              labels.push label
            end
    
          end
        end
    
        return labels
    
      end
    
      def nil_convert(c)
        if c.nil? 
          ""
        else
          c
        end
      end
    
      def strip(s)
        s.gsub(/"/, '').
          gsub(/g/, '').
          gsub(/G/, '').
          gsub(/,/, '').
          split(' ')
      end
    
    end

-   nb
    
    3.3.2.1
    
    3.5.3

### Label<a id="sec-3-8-2" name="sec-3-8-2"></a>

<./app/pdfs/label.rb>

    class Label
    
      def initialize(gauge, size, desc, id, price, updated)
        @gauge = gauge
        @size = size
        @desc = desc
        @id = id
        @price = price
        @updated = updated
      end
    
      attr_reader :gauge, :size, :desc, :id, :price, :supply, :updated
    
    end

## DEPRECATIONS<a id="sec-3-9" name="sec-3-9"></a>

<http://stackoverflow.com/questions/30470333/remove-tables-from-schema>

<./db/migrate>

    bundle exec rails g migration remove_spreadsheets

    def up
      drop_table :spreadsheets
    end

    rake db:migrate

## TODO <a id="sec-3-10" name="sec-3-10"></a>

-   [ ] Testing
-   [ ] sidekiq
    -   [ ] background processes for creating pdfs?
-   [X] requirements
    -   [X] roo
    -   [X] chronic
    -   [X] 3.3.2.1
-   [X] migrate code from cj-parser
-   [X] user authentication
-   [ ] file upload
    -   [ ] AWS
-   [ ] file storage
    -   [ ] archival api?
-   [ ] production
    -   [ ] heroku
        -   [ ] secrets

# Production<a id="sec-4" name="sec-4"></a>

## Heroku<a id="sec-4-1" name="sec-4-1"></a>

<https://onemonth.com/courses/one-month-rails/steps/going-online-with-heroku>

    heroku keys:add
    heroku create

1

    gem 'rails_12factor'

    bundle install --without production

    git add *
    git commit -m "..."
    git push heroku master

    heroku run rake db:migrate

    heroku config:set SECRET_KEY_BASE=$(rake secret)

-   [ ] rack cache
    
    <https://devcenter.heroku.com/articles/rack-cache-memcached-rails31>
    
    -   [ ] install memcached
    
    -   [ ] 1
        
            gem 'rack-cache'
            gem 'dalli'
            gem 'kgio'
    
    -   [ ] <./config/application.rb>
        
        1
        1.3
        
            config.cache_store = :dalli_store
    
    -   [ ] configure Rack::Cache
        -   [ ] <./config/environments/production.rb>
            
            4
            
                client = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                                           :username => ENV["MEMCACHIER_USERNAME"],
                                           :password => ENV["MEMCACHIER_PASSWORD"],
                                           :failover => true,
                                           :socket_timeout => 1.5,
                                           :socket_failure_delay => 0.2,
                                           :value_max_bytes => 10485760)
                config.action_dispatch.rack_cache = {
                  :metastore    => client,
                  :entitystore  => client
                }
                config.static_cache_control = "public, max-age=2592000"
        
        -   [ ] Serve static assets
            
            <./config/environments/production.rb>
            
            4
            
                config.serve_static_assets = true
            
                config.assets.digest = true
                config.action_controller.perform_caching = true
                heroku addons:create memcachier:dev
            
            1
            
                gem "memcachier"
        
        -   [ ] caching in production
            
                git push heroku master
                heroku logs --ps web -t
-   [ ] auth0
    
    <https://elements.heroku.com/addons/auth0>
    
        heroku addons:create auth0:free --subdomain=sonarch
    
        heroku addons:remove auth0 && heroku addons:add auth0 --subdomain=<my-super-app>
    
    -   [ ] setup local env 
        
            heroku config -s | grep 'AUTH0_CLIENT_ID\|AUTH0_CLIENT_SECRET\|AUTH0_DOMAIN' | tee -a .env
