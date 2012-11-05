require File.expand_path('../migrations', __FILE__)

class CreateProductPlacementsTable < Migrations
  def up
    create_table :product_placements do |t|
      t.string  :url
    end

  end

  def down
    drop_table :product_placements
  end
end

CreateProductPlacementsTable.new.up