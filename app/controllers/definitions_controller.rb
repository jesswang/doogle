require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
  end

  def show
    response = Array.new
    request = dictionaryRequest(word: params[:id])
    xml = Nokogiri::XML(request)
    xml.css("dt").each do |d|
      response.push d.content[1..-1] # exclude preceding ":"
    end
    render json: {definitions: response}
  end

  def dictionaryRequest(word: )
    key = "cab72891-f003-43ef-a983-253666d45082"
    return Faraday.new.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{word}?key=#{key}").body
  end
end
