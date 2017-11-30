class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def import
    Beer.import(params[:file])
    redirect_to root_url, notice: "Beer Loaded"
  end

  def stevie
    csv_string = BeerConverter.convert(file: params[:file])
    # get original filename without extension
    filename = File.basename(params[:file].original_filename, ".*")
    send_data csv_string, filename: "#{filename}-export-#{Time.now.to_i}.csv"
  end
end
