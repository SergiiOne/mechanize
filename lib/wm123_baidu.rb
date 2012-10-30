#encoding: utf-8
# siteid = 13501
# "http://wm123.baidu.com:80/site/genHistogram.action?siteId=13501&type=gender"
# "http://wm123.baidu.com:80/site/genHistogram.action?siteId=13501&type=age"
# "http://wm123.baidu.com:80/site/genHistogram.action?siteId=13501&type=degree"
require 'rubygems'
require 'debugger'
require 'mechanize'
require 'json'

class Wm123Baidu
    
end

agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari'

# page = agent.get('http://wm123.baidu.com/site/initSearch.action?wd=%E7%94%B5%E8%84%91&ks=1')

page = agent.get('http://wm123.baidu.com/')

search_form = page.form
search_form.wd = ''
search_form.allCategory = '1'
search_form.action = '/site/getSearchList.action'

page1 = JSON.parse search_form.submit.body
debugger

p '123'
