require 'spec_helper'
require "./weather_service"

RSpec.describe WeatherService, vcr: {record: :once, match_requests_on: [:method, :path]} do

  describe "#weather_by_city" do
    context "when we ask for weather of a real city" do
      it "returns weather" do
        results = subject.weather_by_city("New York")
        parsed_results = JSON.parse(results)
        expect(parsed_results.keys).to eq(["city_name", "consolidated_weather"]) 
      end
    end

    context "when we ask for weather of a unreal city" do
      it "returns weather" do
        results = subject.weather_by_city("Lala land")
        expect(results).to eq("there's no weather data for Lala land") 
      end
    end
  end
end