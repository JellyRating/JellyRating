class MediasController < ApplicationController
    def index

    end

    def new
    end

    def create
        @media = Media.create!(media_params());
        redirect_to medias_path;
    end

    private
        def media_params
            params.require[:media].permit(:title, :release_date);
        end
end