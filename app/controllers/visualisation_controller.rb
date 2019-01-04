class VisualisationController < ApplicationController

  def index
        #https://stackoverflow.com/questions/13777086/shortcut-for-plucking-two-attributes-from-an-activerecord-object
      @damount_country = Clash.select([:country, :total_deaths]).map { |e| {country: e.country, total_deaths: e.total_deaths }}
      #https://stackoverflow.com/questions/43876712/sum-values-in-array-of-hash-if-they-have-the-same-value
      @dc = @damount_country.group_by { |item| [item[:country]]}.values.flat_map {|items| items.first.merge(total_deaths: items.sum {|h| h[:total_deaths].to_i})}
      @hv= @dc.map(&:values).sort
      @country = []
      @damount = []
      @hv.each do |element|
         @country << element[0]
         @damount << element[1]
      end

    #calculate deaths per month
    #@jan_raw = Clash.where("date_start.match(\/\d{1,2}\/) = 01").pluck
    @jan_raw = Clash.where("date_start ~* ?", '\/\m01\M\/').pluck
    @jan = []
    @jan_raw.each {|element| @jan << element[15]}
    @jan_count = @jan.count

    @feb_raw = Clash.where("date_start ~* ?", '\/\m02\M\/').pluck
    @feb = []
    @feb_raw.each {|element| @feb << element[15]}
    @feb_count = @feb.count

    @mar_raw = Clash.where("date_start ~* ?", '\/\m03\M\/').pluck
    @mar = []
    @mar_raw.each {|element| @mar << element[15]}
    @mar_count = @mar.count

    @apr_raw = Clash.where("date_start ~* ?", '\/\m04\M\/').pluck
    @apr = []
    @apr_raw.each {|element| @apr << element[15]}
    @apr_count = @apr.count

    @may_raw = Clash.where("date_start ~* ?", '\/\m05\M\/').pluck
    @may = []
    @may_raw.each {|element| @may << element[15]}
    @may_count = @may.count

    @jun_raw = Clash.where("date_start ~* ?", '\/\m06\M\/').pluck
    @jun = []
    @jun_raw.each {|element| @jun << element[15]}
    @jun_count = @jun.count

    @jul_raw = Clash.where("date_start ~* ?", '\/\m07\M\/').pluck
    @jul = []
    @jul_raw.each {|element| @jul << element[15]}
    @jul_count = @jul.count

    @aug_raw = Clash.where("date_start ~* ?", '\/\m08\M\/').pluck
    @aug = []
    @aug_raw.each {|element| @aug << element[15]}
    @aug_count = @aug.count

    @sep_raw = Clash.where("date_start ~* ?", '\/\m09\M\/').pluck
    @sep = []
    @sep_raw.each {|element| @sep << element[15]}
    @sep_count = @sep.count

    @oct_raw = Clash.where("date_start ~* ?", '\/\m10\M\/').pluck
    @oct = []
    @oct_raw.each {|element| @oct << element[15]}
    @oct_count = @oct.count

    @nov_raw = Clash.where("date_start ~* ?", '\/\m11\M\/').pluck
    @nov = []
    @nov_raw.each {|element| @nov << element[15]}
    @nov_count = @nov.count

    @dec_raw = Clash.where("date_start ~* ?", '\/\m12\M\/').pluck
    @dec = []
    @dec_raw.each {|element| @dec << element[15]}
    @dec_count = @dec.count

    #combine casualty values into array
    @total_cas = []
    @total_cas << @jan_count<< @feb_count<< @mar_count<< @apr_count<< @may_count<< @jun_count<< @jul_count<< @aug_count<< @sep_count<< @oct_count<< @nov_count<< @dec_count




    # #calculate deaths per month in Afghanistan
    @afg_jan_raw = Clash.where("country = 'Afghanistan'").where("date_start ~* ?", '\/\m01\M\/').pluck
    @afg_jan = []
    @afg_jan_raw.each {|element| @afg_jan << element[15]}
    @afg_jan_count = @afg_jan.count

    @afg_feb_raw = Clash.where("date_start ~* ?", '\/\m02\M\/').where("country = 'Afghanistan'").pluck
    @afg_feb = []
    @afg_feb_raw.each {|element| @afg_feb << element[15]}
    @afg_feb_count = @afg_feb.count

    @afg_mar_raw = Clash.where("date_start ~* ?", '\/\m03\M\/').where("country = 'Afghanistan'").pluck
    @afg_mar = []
    @afg_mar_raw.each {|element| @afg_mar << element[15]}
    @afg_mar_count = @afg_mar.count

    @afg_apr_raw = Clash.where("date_start ~* ?", '\/\m04\M\/').where("country = 'Afghanistan'").pluck
    @afg_apr = []
    @afg_apr_raw.each {|element| @afg_apr << element[15]}
    @afg_apr_count = @afg_apr.count

    @afg_may_raw = Clash.where("date_start ~* ?", '\/\m05\M\/').where("country = 'Afghanistan'").pluck
    @afg_may = []
    @afg_may_raw.each {|element| @afg_may << element[15]}
    @afg_may_count = @afg_may.count

    @afg_jun_raw = Clash.where("date_start ~* ?", '\/\m06\M\/').where("country = 'Afghanistan'").pluck
    @afg_jun = []
    @afg_jun_raw.each {|element| @afg_jun << element[15]}
    @afg_jun_count = @afg_jun.count

    @afg_jul_raw = Clash.where("date_start ~* ?", '\/\m07\M\/').where("country = 'Afghanistan'").pluck
    @afg_jul = []
    @afg_jul_raw.each {|element| @afg_jul << element[15]}
    @afg_jul_count = @afg_jul.count

    @afg_aug_raw = Clash.where("date_start ~* ?", '\/\m08\M\/').where("country = 'Afghanistan'").pluck
    @afg_aug = []
    @afg_aug_raw.each {|element| @afg_aug << element[15]}
    @afg_aug_count = @afg_aug.count

    @afg_sep_raw = Clash.where("date_start ~* ?", '\/\m09\M\/').where("country = 'Afghanistan'").pluck
    @afg_sep = []
    @afg_sep_raw.each {|element| @afg_sep << element[15]}
    @afg_sep_count = @afg_sep.count

    @afg_oct_raw = Clash.where("date_start ~* ?", '\/\m10\M\/').where("country = 'Afghanistan'").pluck
    @afg_oct = []
    @afg_oct_raw.each {|element| @afg_oct << element[15]}
    @afg_oct_count = @afg_oct.count

    @afg_nov_raw = Clash.where("date_start ~* ?", '\/\m11\M\/').where("country = 'Afghanistan'").pluck
    @afg_nov = []
    @afg_nov_raw.each {|element| @afg_nov << element[15]}
    @afg_nov_count = @afg_nov.count

    @afg_dec_raw = Clash.where("date_start ~* ?", '\/\m12\M\/').where("country = 'Afghanistan'").pluck
    @afg_dec = []
    @afg_dec_raw.each {|element| @afg_dec << element[15]}
    @afg_dec_count = @afg_dec.count

    #combine casualty values into array
    @afg_total_cas = []
    @afg_total_cas << @afg_jan_count<< @afg_feb_count<< @afg_mar_count<< @afg_apr_count<< @afg_may_count<< @afg_jun_count<< @afg_jul_count<< @afg_aug_count<< @afg_sep_count<< @afg_oct_count<< @afg_nov_count<< @afg_dec_count


    # #calculate deaths per month in Iraq
    @irq_jan_raw = Clash.where("date_start ~* ?", '\/\m01\M\/').where("country = 'Iraq'").pluck
    @irq_jan = []
    @irq_jan_raw.each {|element| @irq_jan << element[15]}
    @irq_jan_count = @irq_jan.count

    @irq_feb_raw = Clash.where("date_start ~* ?", '\/\m02\M\/').where("country = 'Iraq'").pluck
    @irq_feb = []
    @irq_feb_raw.each {|element| @irq_feb << element[15]}
    @irq_feb_count = @afg_feb.count

    @irq_mar_raw = Clash.where("date_start ~* ?", '\/\m03\M\/').where("country = 'Iraq'").pluck
    @irq_mar = []
    @irq_mar_raw.each {|element| @irq_mar << element[15]}
    @irq_mar_count = @irq_mar.count

    @irq_apr_raw = Clash.where("date_start ~* ?", '\/\m04\M\/').where("country = 'Iraq'").pluck
    @irq_apr = []
    @irq_apr_raw.each {|element| @irq_apr << element[15]}
    @irq_apr_count = @irq_apr.count

    @irq_may_raw = Clash.where("date_start ~* ?", '\/\m05\M\/').where("country = 'Iraq'").pluck
    @irq_may = []
    @irq_may_raw.each {|element| @irq_may << element[15]}
    @irq_may_count = @irq_may.count

    @irq_jun_raw = Clash.where("date_start ~* ?", '\/\m06\M\/').where("country = 'Iraq'").pluck
    @irq_jun = []
    @irq_jun_raw.each {|element| @irq_jun << element[15]}
    @irq_jun_count = @irq_jun.count

    @irq_jul_raw = Clash.where("date_start ~* ?", '\/\m07\M\/').where("country = 'Iraq'").pluck
    @irq_jul = []
    @irq_jul_raw.each {|element| @irq_jul << element[15]}
    @irq_jul_count = @irq_jul.count

    @irq_aug_raw = Clash.where("date_start ~* ?", '\/\m08\M\/').where("country = 'Iraq'").pluck
    @irq_aug = []
    @irq_aug_raw.each {|element| @irq_aug << element[15]}
    @irq_aug_count = @irq_aug.count

    @irq_sep_raw = Clash.where("date_start ~* ?", '\/\m09\M\/').where("country = 'Iraq'").pluck
    @irq_sep = []
    @irq_sep_raw.each {|element| @irq_sep << element[15]}
    @irq_sep_count = @irq_sep.count

    @irq_oct_raw = Clash.where("date_start ~* ?", '\/\m10\M\/').where("country = 'Iraq'").pluck
    @irq_oct = []
    @irq_oct_raw.each {|element| @irq_oct << element[15]}
    @irq_oct_count = @irq_oct.count

    @irq_nov_raw = Clash.where("date_start ~* ?", '\/\m11\M\/').where("country = 'Iraq'").pluck
    @irq_nov = []
    @irq_nov_raw.each {|element| @irq_nov << element[15]}
    @irq_nov_count = @irq_nov.count

    @irq_dec_raw = Clash.where("date_start ~* ?", '\/\m12\M\/').where("country = 'Iraq'").pluck
    @irq_dec = []
    @irq_dec_raw.each {|element| @irq_dec << element[15]}
    @irq_dec_count = @irq_dec.count

    #combine casualty values into array
    @irq_total_cas = []
    @irq_total_cas << @irq_jan_count<< @irq_feb_count<< @irq_mar_count<< @irq_apr_count<< @irq_may_count<< @irq_jun_count<< @irq_jul_count<< @irq_aug_count<< @irq_sep_count<< @irq_oct_count<< @irq_nov_count<< @irq_dec_count



    #@jan_raw = Clash.where("date_start.match(\/\d{1,2}\/) = 01").pluck
    #@jan_raw = Clash.where("date_start REGEXP ?", '(\/\d[01]\/)').pluck

  end

end
