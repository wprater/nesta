require "rubygems"
require "sinatra"
require "app"

set :haml, {:format => :html5 }

run Sinatra::Application
