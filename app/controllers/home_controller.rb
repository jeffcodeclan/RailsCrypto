class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?convert=GBP&limit=100'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "XRP", "ETH", "BCH", "XLM", "EOS", "LTC", "USDT", "BSV", "ADA"]
    
  end

  def about
  end

  def lookup
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?convert=GBP&limit=100'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)
    
    @symbol = params[:sym]

    if @symbol 
      @symbol = @symbol.upcase
    end  

    if @symbol == ""
      @symbol = "Please Enter A Currency!"
    end  

  end
  
end
