class ArtworksController < ApplicationController 

    def index 
        # GET /users/:user_id/artworks
        user = User.find(params[:user_id])
        self.render json: user.to_json(include: [:artworks, :shared_artworks])
    end

    def create 
        #POST /artworks
        
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def show 
        #GET /artworks/:id
        artwork = Artwork.find(self.params[:id])
        
        render json: artwork 

        # if user 
        #     render json: user
        # else
        #     render  status: :unprocessable_entity
        # end
    end

    def destroy 
        artwork = Artwork.find_by_id(self.params[:id])
        artwork.destroy
        render json: artwork 
    end

    def update 
        artwork = Artwork.find(params[:id])
        
        if artwork_params.empty? # fix this sometime... 
            p artwork.errors.full_messages << "No vaild parameters given!"

            render json: artwork.errors.full_messages, status: :unprocessable_entity
            
        elsif artwork.update(artwork_params)
            render json: artwork 
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 


    end

    private 
    def artwork_params
        self.params[:artwork].permit(:title, :image_url, :artist_id)
    end
    

end