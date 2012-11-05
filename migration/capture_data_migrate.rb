require File.expand_path('../migrations', __FILE__)

class CreateComscoreOriginDataTable < Migrations
  def up
    create_table :comscore_origin_data do |t|
      t.text  :origin_data
    end

  end

  def down
    drop_table :comscore_origin_data
  end
end

CreateComscoreOriginDataTable.new.up