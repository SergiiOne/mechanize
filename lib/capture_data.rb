#encoding: utf-8
require 'rubygems'
require 'logger'
require 'debugger'
require File.expand_path("../product_placements", __FILE__)
require File.expand_path("../comscore", __FILE__)
require File.expand_path("../comscore_origin_data", __FILE__)

class CaptureData

  def initialize
    @comscore_session = Comscore.new
    @comscore_session.login
  end

  def process
    logger = Logger.new "log/capture_data.log"
    logger.datetime_format = "%Y-%m-%d %H:%M:%S"

    ProductPlacements.all.each do |website|

      begin
        media_id = get_first_media_id(website.url)
        sleep(3)

        unless media_id.nil?
          data = get_comscore_origin_data media_id
          cod  = ComscoreOriginData.new({ 'origin_data' => data.body })
          cod.save
          logger.info("web_url: #{website.url} media_id: #{media_id} comscore: ok id #{cod.id unless cod.nil?} ")
        end

        logger.error("web_url: #{website.url} can not search media_id from comscore")
      rescue Exception => e
        logger.error(e)
      end

    end
  end

  def get_first_media_id(query)
    result = get_json_object_provider(query)
    result['mediaDetails'].first['webId'] unless result['totalCount'] == 0
  end

  def get_json_object_provider(query)
    JSON.parse @comscore_session.json_object_provider(query).content
  end

  def get_comscore_origin_data(media_id)
    @comscore_session.dashboard(media_id)
  end

end
