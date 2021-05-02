# Technical assignment for Contitech

This application receive and parse data coming from [MetaWeather](https://www.metaweather.com/api/) service.
## Usage
- This project uses [Httparty](https://github.com/jnunemaker/httparty) gem for http requests
- It uses rspec for testing
- It uses vcr gem for http mocking tests

Use the normal way to install the gems of the project

```shell
bundle install
```
Once you have the gems installed, now, you will be able to use the script.

This is a simple ruby script to handle weather data. Executes the script in a normal way
using your favorite terminal. 

```shell
# ruby weather_service.rb "New York" 
ruby weather_service.rb <city_name>
```
## Expected results
The script creates a json response based on the api results. You can expect the next json structure.
```json
{
  "city_name": "city_name",
  "consolidated_weather": [
    {
      "current_temp": <numerical value>,
      "the_temp_color_value":<hexadecimal color>,
      "weather_icon_url":<url icon>
    }
  ]
}
````

Example:
```json
{
  "city_name":"New York",
  "consolidated_weather":[ 
    {
      "current_temp":15.434999999999999,
      "the_temp_color_value":"#ffffff",
      "weather_icon_url":"https://www.metaweather.com/static/img/weather/png/c.png"
    },
    {
      "current_temp":22.79,
      "the_temp_color_value":"#ffffff",
      "weather_icon_url":"https://www.metaweather.com/static/img/weather/png/s.png"
    },
    {
      "current_temp":22.415,
      "the_temp_color_value":"#ffffff",
      "weather_icon_url":"https://www.metaweather.com/static/img/weather/png/lr.png"
    },
    {
      "current_temp":24.19,
      "the_temp_color_value":"#ffffff",
      "weather_icon_url":"https://www.metaweather.com/static/img/weather/png/lr.png"
    },
    {
      "current_temp":19.689999999999998,
      "the_temp_color_value":"#ffffff",
      "weather_icon_url":"https://www.metaweather.com/static/img/weather/png/hr.png"
    },
    {
      "current_temp":14.82,
      "the_temp_color_value":"#ffffff",
      "weather_icon_url":"https://www.metaweather.com/static/img/weather/png/lc.png"
    }
  ]
}
```
## Test
You could run the tests using the next command

```shell
rspec spec/weather_service_spec.rb
```

## Architecture
This project has only two files:
  1. weather_api_calls.rb 
    This file handles the requests to the weather api service

  2. weather_service.rb 
    This is the entry point file. This file parses the response for the api call in a 
    specific format.