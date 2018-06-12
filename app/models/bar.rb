class Bar < ApplicationRecord
  def coord
    [latitude, longitude]
  end

  def self.vptree
    @vptree ||= Vptree::VPTree.new(Bar.all) do |obj1, obj2|
      Geocoder::Calculations.distance_between(obj1.coord, obj2.coord, :units => :km)
    end
  end
end
