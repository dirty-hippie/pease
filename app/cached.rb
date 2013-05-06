# TODO: Query from database
# TODO: Update info each 30m


require_relative '../lib/nasa_adapter'
require 'singleton'

module Pease
  class Cached
    include Singleton

    attr_accessor :astronauts

    def initialize
      @astronauts = NASA::ISS.new.current_astronauts
    end
  end
end