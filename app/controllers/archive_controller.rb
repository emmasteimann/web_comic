class ArchiveController < ApplicationController
  def index
    @comics = Comic.current_year
    earliest_year = Comic.initial.first.created_at.year
    current_year = Time.now.year
    year_difference = current_year - earliest_year
    
    comics_by_year = Struct.new :comics
    @comics_all = comics_by_year.new([])
    
    0.upto(year_difference) { |i|
      @comics_all.comics[i] = {"year" => (earliest_year+i).to_s, "comics" => Comic.by_year((earliest_year+i).to_s)}
      @comics_all.comics[i]["comics"] =  @comics_all.comics[i]["comics"].reverse
    }
    @comics_all.comics =  @comics_all.comics.reverse
  end

  def show
    @loadcomics = Comic.by_year(params[:id])
    
    if(@loadcomics.count > 0)
      @comics = @loadcomics
    end
    
  end

end
