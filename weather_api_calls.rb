require 'rubygems'
require 'httparty'

#This class handles de api call to https://www.metaweather.com/api/
class WeatherApiCalls

  BASE_URL = "https://www.metaweather.com/api/"

  #Handle requests of weather by city
  def weather_by_city(city)
    woeid = woeid_by_city(city).find{ |c| c['title'].eql?(city) }['woeid']
    final_url = "#{BASE_URL}/location/#{woeid}"
    rest_client(:get, final_url).parsed_response
  end

  #returns woeid code based on a location
  def woeid_by_city(city)
    final_url = "#{BASE_URL}/location/search/?query=#{city}"
    rest_client(:get, final_url).parsed_response
  end

  private

  #Handles api call using HTTParty gem
  def rest_client(method, url, body = nil)
    options = {}
    headers = {
      'Content-Type'=> 'application/json'
    }
    options[:headers] = headers
    options[:body] = body if body
    
    HTTParty.send(method, url, options)
  end

end
