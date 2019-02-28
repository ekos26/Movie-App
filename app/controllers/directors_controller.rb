class DirectorsController < ApplicationController

  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    @movies = @director.movies
  end

  def edit
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    director = Director.create(director_params)
    if director.valid?
      redirect_to director_path(director)
    else
      flash[:errors] = director.errors.full_messages
      redirect_to new_director_path
    end
  end

  def update
    director = Director.find(params[:id])
    director.update(director_params)
    redirect_to director_path(director)
  end

  def destroy
    director = Director.find(params[:id])
    director.movies.destroy_all
    director.destroy
    redirect_to directors_path
  end

  private

  def director_params
    params.require(:director).permit(:name, :age, :awards)
  end

end
