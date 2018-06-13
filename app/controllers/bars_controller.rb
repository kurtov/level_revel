class BarsController < ApplicationController
  NEAR_DISTANCE = 4

  def near
    bar = Bar.new(params.permit(:latitude, :longitude))
    @bars_with_dist = Bar.vptree.find_nearest_by_radius(bar, NEAR_DISTANCE)
  end
end
