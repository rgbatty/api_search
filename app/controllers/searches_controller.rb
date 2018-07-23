class SearchesController < ApplicationController
    def index
    end

    def create
        search = Search.find_or_create(search_params)
        redirect_to search_path(search)
    end

    def show
        @search = Search.find(params[:id])
        @results = @search.search_for_keyword
    end

    def search_params
        params.require(:search).permit(:keyword)
    end
end