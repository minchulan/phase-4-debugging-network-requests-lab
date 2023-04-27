class ToysController < ApplicationController
  wrap_parameters format: []

  # GET all 
  def index
    toys = Toy.all
    render json: toys
  end

  def show
    toy = Toy.find_by(id: params[:id])
    render json: toy 
  end 

  #POST
  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  #PATCH
  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
  end

  #DELETE
  def destroy
    toy = Toy.find_by(id: params[:id]) #find the item
    if toy #if found
      toy.destroy #destroy it 
      head :no_content #send head no content
    else  #else
      render json: {error: "toy not found"} #render toy not found
    end 


  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
