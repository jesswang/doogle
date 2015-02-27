require 'open-uri'
require 'nokogiri'

class DefinitionsController < ApplicationController

  def home
  end

  def show
    request = Faraday.new(:url => 'http://www.dictionaryapi.com/api/v1/references/collegiate/xml')
    request.get params[:word], { :key => 'cab72891-f003-43ef-a983-253666d45082' }
    response = Nokogiri::XML(request)
  end
end
