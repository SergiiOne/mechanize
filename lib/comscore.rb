require 'rubygems'
require 'debugger'
require 'json'
require 'mechanize'
require 'active_record'

class Comscore

  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @page = @agent.get('https://my.comscore.com/login/')
  end

  def login(username = 'chs_syim', password = '1malone')
    login_form = @page.form('loginform')
    login_form.reg_id_swf = 'F80E34627B4349C685E5DFB75CB56280'
    login_form.reg_id_cookie = ''
    login_form.userid = username
    login_form.passwd = password
    @agent.submit(login_form)
  end

  def json_object_provider(query)
    @agent.post('http://mymetrix.comscore.com/app/JSONObjectProvider.aspx',
      { 'Requesting' => 'UNIVERSAL_SEARCH_MEDIA_WITHOUT_CATEGORIES',
        'GeographyId' => '156',
        'query' => query
      }
    )
  end

  def dashboard(media_id)
    @agent.post( 'http://mymetrix.comscore.com/app/Dashboard.ashx/Dashboard/GetMainData',
      { 
        'mediaId' => media_id.to_s,
        'countryId' => '156',
        'startTime' => '10/29/2012 17:44:31.997+0800',
        'dashboardId' => 'ext-comp-1022',
        'includeUnreleasedData' => 'false',
        'monthOverMonth' => 'false'
      }
    )
    
  end
  
end

# agent = Comscore.new
# agent.login
# result = JSON.parse agent.json_object_provider('iteye').content
# debugger
# p agent.dashboard result['mediaDetails'].first['webId']