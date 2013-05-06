module Pease
  class API < Grape::API
    format :json

    get :astronauts do
      Cached.instance.astronauts
    end
  end
end
