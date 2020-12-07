class ArtworkSharesController < ApplicationController 

    def create 
        # POST /artwork_shares
        artwork_share = ArtworkShare.new(artwork_shares_params)

        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy
        #DELETE /artwork_shares/:id
        artwork_share = ArtworkShare.find_by_id(self.params[:id])
        if artwork_share.destroy
            render json: artwork_share
        else 
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def artwork_shares_params
        self.params[:artwork_shares].permit(:viewer_id, :artwork_id)
    end
    

end
