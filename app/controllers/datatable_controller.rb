class DatatableController < ApplicationController
  def index
    @clash_description = Clash.all
  end

  def show
  end
end
