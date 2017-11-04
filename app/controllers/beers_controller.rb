class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def import
    Beer.import(params[:file])
    redirect_to root_url, notice: "Beer Loaded"
  end
end
