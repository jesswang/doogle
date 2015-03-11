require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
  end

  def show
    if Definition.exists?(word: params[:id])
      response = retrieveRecordFromDatabase(word: params[:id])
    else
      response = makeDictionaryRequest(word: params[:id])
    end
    render json: {definitions: response}
  end

  def makeDictionaryRequest(word: )
    response = Array.new
    key = "cab72891-f003-43ef-a983-253666d45082"
    request = Faraday.new.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{word}?key=#{key}").body
    xml = Nokogiri::XML(request)
    xml.css("dt").each do |d|
      response.push d.content[1..-1] # exclude preceding ":"
    end
    return response
  end

  def retrieveRecordFromDatabase(word: )
    Definition.where(word: params[:id])
  end
end
