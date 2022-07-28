class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @movie = Movie.all
  end

  def Create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.permit(@bookmark).require(:movie, :comment)
  end
end
