class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species } # we've created a new hash out of three keys, assigning the keys manually with the attributes of bird
    # render json: bird.slice(:id, :name, :species)
    # write our own error messaging in the event that a request is made for a record that doesn't exist:    
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end