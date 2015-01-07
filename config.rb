require 'bh/core_ext/middleman'
config.title = 'ShakeSPEAR'

Middleman::Extensions.register(:bh, Bh::Extensions::MiddlemanExtension)
activate :bh
activate :autoprefixer

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :build do
  activate :relative_assets
  set :relative_links, true
end