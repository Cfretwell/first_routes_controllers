class UsersController < ApplicationController 

    def index 
        # GET /users/
        self.render json: User.all 
    end

    def create 
        #POST /users
        
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

    end

    def show 
        #GET /users/:id
        user = User.find(self.params[:id])
        
        render json: user 

        # if user 
        #     render json: user
        # else
        #     render  status: :unprocessable_entity
        # end
    end

    def destroy 
        user = User.find_by_id(self.params[:id])
        user.destroy
        render json: user 
    end

    def update 
        user = User.find(params[:id])
        
        if user_params.empty? # fix this sometime... 
            p user.errors.full_messages << "No vaild parameters given!"

            render json: user.errors.full_messages, status: :unprocessable_entity
            
        elsif user.update(user_params)
            render json: user 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 


    end

    private 
    def user_params
        self.params[:user].permit(:username)
    end
    

end