class MediaController < ApplicationController
    skip_before_filter :set_current_user, only: [:index, :show]
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
        @media = Media.all
    end

    private
        def media_params
            params.require(:media).permit(:title, :release_date);
        end
end