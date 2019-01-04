require 'csv'
namespace :battles do
  desc "Create tornadoes tables"
  task seed_battles: :environment do

    Book.destroy_all
    Country.destroy_all
    Conflict.destroy_all
  	Clash.destroy_all


  	CSV.foreach("lib/assets/Books.csv", :headers =>true) do |row|


      Book.create!(
      title: row[4],#
      author: row[2],#
      year: row[3].to_i,#
      isbn: row[1].to_i,#
      region: row[5],
      rating: row[6].to_f,
      price: row[7].to_f,
      image: row[8]
    )
    end


    CSV.foreach("lib/assets/Countries.csv", :headers =>true) do |row|


      Country.create!(
      country: row[0],
      country_formal: row[1],
      population: row[2].to_i,
      gdp: row[3].to_i,
      economy_type: row[4],
      income_level: row[5],
      region: row[6],
      lon: row[7].to_f,
      lat: row[8].to_f
    )
    end

    CSV.foreach("lib/assets/Conflicts.csv", :headers =>true) do |row|

  country = Country.find_by(country: row[2])
  country_id = country ? country.id.to_i : nil


    Conflict.create!(
    conflict_new_id: row[0].to_i,
    conflict_name: row[1],
    country: row[2],
    country_id: country_id
)
end


CSV.foreach("lib/assets/Clashes.csv", :headers =>true) do |row|

    conflict = Conflict.find_by(conflict_new_id: row[1].to_i)
    conflict_id = conflict ? conflict.id.to_i : nil


    Clash.create!(
    #clash_id: row[1].to_i,
    conflict_id: row[1].to_i,
    conflict_name: row[2],
    dyad_name: row[3],
    #begin_time: row[4],
    side_a: row[4],
    side_b: row[5],
    source_article: row[6],
    source_office: row[7],
    source_date: row[8],
    source_headline: row[9],
    source_original: row[10],
    location: row[11],
    lat: row[12].to_f,
    lon: row[13].to_f,
    country: row[14],
    region: row[15],
    date_start: row[16],
    date_end: row[17],
    deaths_a: row[18].to_i,
    deaths_b: row[19].to_i,
    deaths_unknown: row[21].to_i,
    total_deaths: row[22].to_i,
    conflict_id: conflict_id
)
  end
end
end
