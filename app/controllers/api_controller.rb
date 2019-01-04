class ApiController < ApplicationController

  def country
    @country=Country.all
    render json: @country
  end

  def conflict
    @conflict=Conflict.all
    render json: @conflict
  end

  def clash
    @clash=Clash.all
    render json: @clash
  end

end
