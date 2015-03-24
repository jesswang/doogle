class DefinitionsController < ApplicationController

  def home
  end

  def show
    # Show definitions from the database if record(s) exist(s), otherwise call API
    definitions = Definition.where(word: params[:id]).pluck(:meaning)
    if definitions.length > 0
      response = definitions
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
    response
  end
end
