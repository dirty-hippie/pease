require 'grape'
require 'multi_json'
require_relative 'api/api'

module Pease
  class App
    def call(env)
      response = Pease::API.call(env)
    end
  end
end
