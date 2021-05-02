require_relative 'weather_api_calls'

class WeatherService

  #Based on a city name, this method makes an api call the weather service
  #and parse the results in accordance with requirements.
  def weather_by_city(city)
    weather_data = api.weather_by_city(city)
    if weather_data.nil?
      return "there's no weather data for #{city}"
    end
    
    weather_parser(weather_data).to_json
  end

  #This method parses the data in a specific format
  def weather_parser(weather_data)
    consolidated_weather = weather_data["consolidated_weather"]
    consolidated_weather.map! do |w|
      {
        current_temp:          w['the_temp'],
        the_temp_color_value:  color_by_temp(w['the_temp']),
        weather_icon_url:      weather_icon_by_abbr(w['weather_state_abbr'])
      }
    end
    
    #final result
    { 
      city_name: weather_data['title'], 
      consolidated_weather: consolidated_weather
    }
  end

  #this method returns a color depends of the weather
  def color_by_temp(temp)
    case temp
    when temp < -1
      "#6699ff"
    when temp > 23
      "#cc0000"
    else
      "#ffffff" #what should happens with values avoid of the ranges?
    end
  end

  def weather_icon_by_abbr(abbr)
    "https://www.metaweather.com/static/img/weather/png/#{abbr}.png"
  end

  #This method returns an instance of api call manager
  def api
    @api ||= WeatherApiCalls.new
  end
end

city = ARGV[0]
puts WeatherService.new.weather_by_city(city)