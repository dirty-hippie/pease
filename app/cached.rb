require_relative '../lib/nasa_adapter'

module Pease
  class Cached
    # TODO: Query from database
    # TODO: Update info each 30m

    include Singleton
    attr_accessor :astronauts
    def initialize
      @astronauts = NASA::ISS.new.current_astronauts
    end
  end
end