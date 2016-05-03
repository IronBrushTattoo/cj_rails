<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Files</a>
<ul>
<li><a href="#sec-1-1">1.1. Gemfile</a></li>
</ul>
</li>
</ul>
</div>
</div>

<div class="center">
**Iron Brush Tattoo**
*Case Jewelry*
Rails Application
Tue May  3 10:45:24 CDT 2016
AnderSon
<https://github.com/IronBrushTattoo/cj_rails.git>
</div>

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
