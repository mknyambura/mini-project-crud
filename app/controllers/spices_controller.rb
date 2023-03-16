class SpicesController < ApplicationController
    
    wrap_parameters formmat: []
    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spices = Spice.find_by(id: params[:id])
        if spices
            render json: spices, except: [:created_at, :updated_at]
        else
            render json: { error: "Spice not found" }
        end
    end

    def create
        # byebug
        spice = Spice.create(title: params[:title], image: params[:image], description: params[:description], notes: params[:notes], rating: params[:rating])
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.update(spice_params)
          render json: spice
        else
          render json: { error: "Spice not found" }, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end


    def increment_ratings
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(rating: spice.rating + 1)
            render json: spice
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
      end
end
