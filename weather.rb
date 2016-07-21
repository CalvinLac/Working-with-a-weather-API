require 'httparty'

class Weather

BASE_URI = 'http://api.apixu.com/v1/forecast.json?'

	def initialize
		@days = 5
		@location = 'Calgary, AB'
		@key = 'cece34128c864a029110d5a0d58b1122'

	end

	def forecast_for(location)
    	path = "#{BASE_URI}q=#{@location}&key=#{@key}&days=#{@days}"
    	@response = HTTParty.get(path)
    	@forecast = @response["forecast"]["forecastday"]
    end

end

w = Weather.new 
w.forecast_for(location: "Calgary, AB")