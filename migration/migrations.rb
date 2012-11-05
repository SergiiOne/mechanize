#encoding: utf-8
require 'rubygems'  
require 'active_record'

ActiveRecord::Base.establish_connection(  
  :adapter => "mysql",  
  :host => "localhost",  
  :database => "comscore",
  :username => "root",
  :password => "123456" 
)

class Migrations < ActiveRecord::Migration
    
end