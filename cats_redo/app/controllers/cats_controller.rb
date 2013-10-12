class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def new
    render :create
  end

  def create
    @cat = Cat.new(params[:cat])

    if @cat.save
      redirect_to cats_url
    else
      flash.errors = @cat.errors.full_messages
      redirect_to new_cat_url
    end
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def edit
     @cat = Cat.find(params[:id])
     render :edit
  end

  def update
     @cat = Cat.find(params[:id])

     if @cat.update_attributes
       redirect_to cat_url
     else
       falsh.errors = @cat.errors.full_messages
       redirect_to edit_cat_url
     end
  end

  def destroy
     @cat = Cat.find(params[:id])
     @cat.destroy
     redirect_to cats_url
  end

end
