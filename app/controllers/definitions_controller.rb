require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
  end

  def show
    WebMock.allow_net_connect!
    response = Array.new
    request = Faraday.new.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{params[:id]}?key=cab72891-f003-43ef-a983-253666d45082").body
    xml = Nokogiri::XML(request)
    xml.css("dt").each do |d|
      response.push d.content[1..-1]
    end
    render json: {definitions: response}
  end
end
