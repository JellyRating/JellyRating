class MediaController < ApplicationController
    skip_before_filter :set_current_user, only: [:index, :show, :list_all]
    def index

    end

    def new
        @media = Media.new
    end

    def create
        @media = Media.new(media_params)
        if @media.save       
            flash[:notice] = "#{@media.title} successfully added!"
            redirect_to media_path
        else
            flash[:warning] = @media.errors.full_messages
            render 'new'
        end
    end

    def show
        id = params[:id]
        @media = Media.find(id)
        @like_count = @media.avaliations.where("avaliations.rating = ?", true).size
        @dislike_count = @media.avaliations.where("avaliations.rating = ?", false).size
    end

    def list_all
        @media = Media.all
    end    

    private
        def media_params
            params.require(:media).permit(:title, :release_date);
        end
end