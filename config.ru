
require './application'
require './app/cached'
Pease::Cached.instance
run Pease::App.new