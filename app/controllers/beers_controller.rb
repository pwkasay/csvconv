class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def import
    Beer.import(params[:file])
    redirect_to root_url, notice: "Beer Loaded"
  end

  def stevie
    csv_string = CSV.generate do |csv|
      # CHANGE THIS TO ACTUALLY GENERATE THE CSV YOU WANT
      csv << ["Stevie-header", "Ray-header"]
      csv << ["Paul-value", "Kasay-value"]
    end
    send_data csv_string, filename: "stevie-#{Time.now.to_i}.csv"
  end
end
