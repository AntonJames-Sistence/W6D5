class CatsController < ApplicationController
    

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render JSON: @cat
    end

    def create
        @cat = Cat.new(cat_params)
        
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render JSON: @cat.errors.full_messages, status :422
        end
    end

    def update
        @cat = Cat.find(params[:id])
        
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render JSON: @cat.errors.full_messages, status :422
        end
    end
    
    private
   
    def cat_params
        params.require(:cats).permit(:name,:color,:birth_date,:sex,:description)
    end
end