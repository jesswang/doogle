require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
  end

  def show
    # Show definitions from the database if record(s) exist(s), otherwise call API
    if Definition.exists?(word: params[:id])
      response = retrieveRecordFromDatabase(word: params[:id])
    else
      response = makeDictionaryApiRequest(word: params[:id])
    end
    render json: {definitions: response}
  end

  def makeDictionaryApiRequest(word: )
    response = Array.new
    key = "cab72891-f003-43ef-a983-253666d45082"
    request = Faraday.new.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{word}?key=#{key}").body
    xml = Nokogiri::XML(request)

    # extract content from <dt> XML tags
    xml.css("dt").each do |d|
      meaning = d.content[1..-1] # exclude preceding ":"
      response.push meaning

      # save to DB
      Definition.create(word: word, meaning: meaning)
    end
    return response
  end

  def retrieveRecordFromDatabase(word: )
    response = Array.new
    Definition.where(word: params[:id]).each do |entry|
      response.push entry.meaning
    end
    return response
  end
end
