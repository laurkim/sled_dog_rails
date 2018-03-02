class SledsController < ApplicationController
  before_action :get_sled, only: [:show, :edit, :update, :destroy]

  def index
    @sleds = Sled.all
  end

  def new
    @sled = Sled.new
  end

  def create
    @sled = Sled.new(sled_params)
    if @sled
      @sled.save
      redirect_to sled_path(@sled)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sled.update(sled_params)
      redirect_to @sled
    else
      render :edit
    end
  end

  def destroy
    @sled.delete
    redirect_to sleds_path
  end

  private

    def sled_params
      params.require(:sled).permit(:name)
    end

    def get_sled
      @sled = Sled.find(params[:id])
    end
end
