require 'rubygems'
require 'debugger'
require 'json'
require 'mechanize'

agent = Mechanize.new{ |agent|
  agent.user_agent_alias = 'Mac Safari'
}

page = agent.get('https://my.comscore.com/login/') 

  login_form = page.form('loginform')
  login_form.reg_id_swf = 'C69DB40B732541D18F5C535E13A56B1E'
  login_form.reg_id_cookie = 'C69DB40B732541D18F5C535E13A56B1E'
  login_form.userid = 'chs_syim'
  login_form.passwd = '1malone'
page = agent.submit(login_form)
page = agent.post('http://mymetrix.comscore.com/app/JSONObjectProvider.aspx' , {'Requesting' => 'UNIVERSAL_SEARCH_MEDIA_WITHOUT_CATEGORIES' , 'GeographyId' => '156' , 'query' => 'iteye.com'})

query_hash = JSON.parse(page.content)

query_page = agent.post('http://mymetrix.comscore.com/app/Dashboard.ashx/Dashboard/GetMainData',
                        { 'mediaId' => '9875062',
                          'countryId' => '156',
                          'startTime' => '10/29/2012 17:44:31.997+0800',
                          'dashboardId' => 'ext-comp-1022',
                          'includeUnreleasedData' => 'false',
                          'monthOverMonth' => 'false'
                        }
                      )
result_hash = JSON.parse(query_page.content)
