#encoding: utf-8
require 'rubygems'
require 'wm123_baidu'

describe Wm123Baidu, "wm123_baidu test" do
  
  it "should initialize a instance" do
    wm = Wm123Baidu.new

    wm.should_not eq(nil)
  end

  it "should get a search list, it is a hash" do
    wm          = Wm123Baidu.new
    search_list = wm.get_search_list('pconline.com.cn')

    search_list.class.should eq(Hash)
    search_list['data']['listData'].first['siteUrl']['siteId'].should eq(13501)
  end

  it "should get a hash with query 'zol.com.cn' " do
    wm          = Wm123Baidu.new
    search_list = wm.get_search_list('zol.com.cn')

    search_list.class.should eq(Hash)
    search_list['data']['listData'].first['siteUrl']['siteId'].should eq(186)
  end

  it "should get a hash with query 'zhibo8.cc' " do
    wm          = Wm123Baidu.new
    search_list = wm.get_search_list('zhibo8.cc')

    search_list.class.should eq(Hash)
    search_list['data']['listData'].first['siteUrl']['siteId'].should eq(116062)
  end

  it "should get xml with siteid & type" do
    wm = Wm123Baidu.new

    search_list = wm.get_search_list('zol.com.cn')
    siteid      = search_list['data']['listData'].first['siteUrl']['siteId']
    
    wm.gen_histogram(siteid, 'gender').should_not eq(nil)
  end



end