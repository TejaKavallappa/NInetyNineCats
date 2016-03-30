class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to "/cats/#{@cat.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to "/cats/#{@cat.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def cat_params
    params.permit(:name, :color, :birth_date, :sex, :description)
  end
end
