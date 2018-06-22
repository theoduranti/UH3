class ProsController < ApplicationController
    def index
      @pros = Pro.all
    end
  
    def show
      @pro = Pro.find(params[:id])
    end
end