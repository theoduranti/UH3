class ElesController < ApplicationController
    def index
        @eles = Ele.all
    end
    
    def show
        @ele = Ele.find(params[:id])
    end
end
