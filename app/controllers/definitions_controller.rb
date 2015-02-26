require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
    # doc = Nokogiri::XML(open("http://dictionaryapi.com/api/v1/references/collegiate/xml/poodle?key=cab72891-f003-43ef-a983-253666d45082"))
    # tags = doc.css("def")
  end
end
