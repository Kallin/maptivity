class CourtsController < ApplicationController

  respond_to :json, :xml

  def show

    courts = [
        {:lat => 37.801532, :lng => -122.420358, :rotation => -8.5, :doubles => false},
        {:lat => 37.801549, :lng => -122.420209, :rotation => -8.5, :doubles => true},
        {:lat => 37.801569, :lng => -122.420041, :rotation => -8.5, :doubles => true},
        {:lat => 37.801588, :lng => -122.419892, :rotation => -8.5, :doubles => false},
        {:lat => 37.751935, :lng => -122.465202, :rotation => -3.7, :doubles => true},
        {:lat => 37.751948, :lng => -122.465025, :rotation => -3, :doubles => true},
        {:lat => 37.751955, :lng => -122.464867, :rotation => -3, :doubles => true}
    ]

    #@courts = courts
    #todo: rabl doesn't play well with hashes

    render json: courts

  end

end