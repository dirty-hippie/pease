require_relative 'lib/nasa_adapter'

module Pease
  class Cached
    include Singleton
    attr_accessor :astronauts
    def initialize
      @astronauts = NASA::ISS.new.current_astronauts
    end
  end
end