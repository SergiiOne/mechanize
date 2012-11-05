require File.expand_path('../../lib/product_placements', __FILE__)
require File.expand_path('../../lib/comscore_origin_data', __FILE__)

url_file = File.expand_path('../../tmp/product_placements.txt', __FILE__)

File.read(url_file).each_line do |line|
  # ComscoreOriginData.create()
  ProductPlacements.create(:url => line)
end
