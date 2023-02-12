class MoviesController < ApplicationController

    def index 
        movies = Movie.all 
        render json: movies
    end

    def create
        movie = Movie.create(movie_params)
        if movie.valid?
            render json: { movie: movie}, status: :created
        else
            render json: {error: "Failed to add movie"}
        end
    end

    def show
        movie = Movie.find_by(id: params[:id])
        if movie 
            render json: movie
        else
            render json: {error: "Failed to load movie"}
        end
    end

    def update
        movie = Movie.find_by(id: params[:id])
        if movie.valid?
            movie.update(movie_params)
            render json: movie
        else
            render json: {error: "movie does not exist"}, status: :not_found
        end
    end

    def destroy
        movie = Movie.find_by(id: params[:id])
        if movie
            movie.destroy
            render json: {msg: 'movie deleted'}
        else
            render json: {error: 'movie does not exist'}, status: :not_found
        end
    end

    private 

    def movie_params
        params.require(:movie).permit(:title, :year, :length, :description, :poster_url, :category, :discount, :female_director)
    end
end
