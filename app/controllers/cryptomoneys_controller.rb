class CryptomoneysController < ApplicationController
  before_action :set_cryptomoney, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /cryptomoneys
  # GET /cryptomoneys.json
  def index
    @cryptomoneys = Cryptomoney.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?convert=GBP&limit=100'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_cryptomoney = JSON.parse(@response)
    @profit_loss = 0
  end

  # GET /cryptomoneys/1
  # GET /cryptomoneys/1.json
  def show
    @cryptomoneys = Cryptomoney.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?convert=GBP&limit=100'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @show_cryptomoneys = JSON.parse(@response)
  end

  # GET /cryptomoneys/new
  def new
    @cryptomoney = Cryptomoney.new
  end

  # GET /cryptomoneys/1/edit
  def edit
  end

  # POST /cryptomoneys
  # POST /cryptomoneys.json
  def create
    @cryptomoney = Cryptomoney.new(cryptomoney_params)

    respond_to do |format|
      if @cryptomoney.save
        format.html { redirect_to @cryptomoney, notice: 'Cryptomoney was successfully created.' }
        format.json { render :show, status: :created, location: @cryptomoney }
      else
        format.html { render :new }
        format.json { render json: @cryptomoney.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptomoneys/1
  # PATCH/PUT /cryptomoneys/1.json
  def update
    respond_to do |format|
      if @cryptomoney.update(cryptomoney_params)
        format.html { redirect_to @cryptomoney, notice: 'Cryptomoney was successfully updated.' }
        format.json { render :show, status: :ok, location: @cryptomoney }
      else
        format.html { render :edit }
        format.json { render json: @cryptomoney.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptomoneys/1
  # DELETE /cryptomoneys/1.json
  def destroy
    @cryptomoney.destroy
    respond_to do |format|
      format.html { redirect_to cryptomoneys_url, notice: 'Cryptomoney was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cryptomoney
      @cryptomoney = Cryptomoney.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cryptomoney_params
      params.require(:cryptomoney).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.cryptomoneys.find_by(id: params[:id])
      redirect_to cryptomoneys_path, notice: "Not Authorized to edit this entry" if @correct.nil?
    end  
end
