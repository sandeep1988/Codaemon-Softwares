class TesturlsController < ApplicationController
  before_action :set_testurl, only: [:show, :edit, :update, :destroy]

  # GET /testurls
  # GET /testurls.json
  def index
    @testurls = Testurl.all
  end

  # GET /testurls/1
  # GET /testurls/1.json
  def show
  end

  # GET /testurls/new
  def new
    @testurl = Testurl.new
  end

  # GET /testurls/1/edit
  def edit
  end

  # POST /testurls
  # POST /testurls.json
  def create
    @str = params[:testurl][:name]
    r = rand(255).to_s(16)
    g = rand(255).to_s(16)
    b = rand(255).to_s(16)
    r, g, b = [r, g, b].map { |s| if s.size == 1 then '0' + s else s end }
    color = r + g + b
    str_split = @str.gsub("http://","").split("/")
    if str_split.first.include?("www")
      last_slash_tokan = str_split.last
      last_slash_new = last_slash_tokan.gsub(last_slash_tokan,color)
      first_slash_token =  str_split.first
      first_slash_new = first_slash_token.gsub(first_slash_token,"localhost")
    else
      last_slash_tokan = str_split.last
      last_slash_new = last_slash_tokan.gsub(last_slash_tokan,color)
      first_slash_token =  str_split.first
      first_slash_new = first_slash_token.gsub(first_slash_token,"www")
    end
      @str1 = @str.gsub(first_slash_token,first_slash_new).gsub(last_slash_tokan,last_slash_new)
      @testurl = Testurl.create(:name=> @str1)
      respond_to do |format|
        if @testurl.save
          format.html { redirect_to @testurl, notice: 'Testurl was successfully created.' }
          format.json { render :show, status: :created, location: @testurl }
        else
          format.html { render :new }
          format.json { render json: @testurl.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /testurls/1
  # PATCH/PUT /testurls/1.json
  def update
    respond_to do |format|
      if @testurl.update(testurl_params)
        format.html { redirect_to @testurl, notice: 'Testurl was successfully updated.' }
        format.json { render :show, status: :ok, location: @testurl }
      else
        format.html { render :edit }
        format.json { render json: @testurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testurls/1
  # DELETE /testurls/1.json
  def destroy
    @testurl.destroy
    respond_to do |format|
      format.html { redirect_to testurls_url, notice: 'Testurl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testurl
      @testurl = Testurl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testurl_params
      params.require(:testurl).permit(:name)
    end
end
