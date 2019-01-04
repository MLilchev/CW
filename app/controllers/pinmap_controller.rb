class PinmapController < ApplicationController
  def index
      @country_data=Country.all
      @conflict_data=Conflict.all
  end

  def show
    @country_no = Country.find(params[:id])
    @country_raw = Country.where(id: params[:id]).pluck.flatten
    @clash_data = Clash.all
    @clash_details = Conflict.where('country_id IN (?)', @country_no.conflicts.select(:id))
  end
end
