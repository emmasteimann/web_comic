class ArchiveController < ApplicationController
  def index
    @comics = Comic.current_year
  end

  def show
    @loadcomics = Comic.by_year(params[:id])
    
    if(@loadcomics.count > 0)
      @comics = @loadcomics
    end
    
  end

end
