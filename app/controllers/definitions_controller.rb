require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
  end

  def show
    WebMock.allow_net_connect!

    request = Faraday.new.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{params[:id]}?key=cab72891-f003-43ef-a983-253666d45082").body
    response = Nokogiri::XML(request)
    defs = doc.css("def")
    render json: {key: "value"}
  end
end
