require 'httparty'
require 'pp'
require 'json'
require 'colorize'

class WeatherForecast 
  include HTTParty

  mode='json' 

  attr_accessor :location, :number_days
  def initialize(location='Calgary',number_days='2')
  @base_uri ='http://api.openweathermap.org/data/2.5/forecast/daily?' 
  @api= '' 
  @location= 'Calgary'
  @number_days=number_days
  end

  def request
      request_uri= "#{@base_uri}q=#{@location}&APPID=#{@api}"
      @response=HTTParty.get(request_uri)
      pp @response
  end

  def hi_temp
    hi_temps = []
    low_temp = []
    @response['list'].each do |day|
      hi_temps.push day['temp']['max']
      low_temp.push day['temp']['min']
    end
    puts "The high temp for today is #{hi_temps[0]}".red
    puts "The low temp for today is #{low_temp[0]}".blue
    puts "The high temp for tomorrow is #{hi_temps[1]}".red
    puts "The low temp for tomorrow is #{low_temp[1]}".blue

  end


end

w = WeatherForecast.new
w.request
w.hi_temp