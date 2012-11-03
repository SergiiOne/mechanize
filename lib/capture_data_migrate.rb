require 'rubygems'  
require 'active_record'

ActiveRecord::Base.establish_connection(  
  :adapter => "mysql",  
  :host => "localhost",  
  :database => "comscore",
  :username => "root",
  :password => "123456" 
)

class CreateComscoreOriginDataTable < ActiveRecord::Migration
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