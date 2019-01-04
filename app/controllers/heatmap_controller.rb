class HeatmapController < ApplicationController
  layout false

  def index
    @clash_data = Clash.all.pluck.map { |a| [a[12], a[13]] }
    #@clash_data1 = Clash.all.pluck#.map { |a| [a[0], a[1], a[2], a[3], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]] }
  end
end
