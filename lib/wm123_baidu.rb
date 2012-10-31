#encoding: utf-8
# siteid = 13501
# "http://wm123.baidu.com:80/site/genHistogram.action?siteId=13501&type=gender"
# "http://wm123.baidu.com:80/site/genHistogram.action?siteId=13501&type=age"
# "http://wm123.baidu.com:80/site/genHistogram.action?siteId=13501&type=degree"
require 'rubygems'
require 'debugger'
require 'mechanize'
require 'uri'
require 'json'
require 'rexml/document'

class Wm123Baidu

  def initialize
    @agent                  = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
  end

  def get_search_list(query)
    page = @agent.get('http://wm123.baidu.com/')

    search_form             = page.form
    search_form.wd          = query
    search_form.allCategory = '1'
    search_form.action      = '/site/getSearchList.action'

    JSON.parse(search_form.submit.content)
  end

  def gen_histogram(siteid, type)
    url = "http://wm123.baidu.com:80/site/genHistogram.action?siteId=#{siteid}&type=#{type}"
    page = @agent.get(url).content
  end
    
end



# debugger
# xml_obj = REXML::Document.new(xml_gender)

# p xml_obj.root.elements[1].attributes['p1']
# debugger
# p '123'
# page['data']['listData']
# page['data']['listData'][1]['siteUrl']['siteId']

