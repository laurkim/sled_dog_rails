class DogsController < ApplicationController

  before_action :get_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog
      @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render :edit
    end
  end

  def destroy
    @dog.delete
    redirect_to dogs_path
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :breed, :sled_id)
    end

    def get_dog
      @dog = Dog.find(params[:id])
    end

end
