# Book.update! id: 71, active: true
# Book.update! id: 72, active: true
# Book.update! id: 73, active: true
# Book.update! id: 74, active: true
# Book.update! id: 75, active: true
# Book.update! id: 76, active: true
# Book.update! id: 77, active: true
# Book.update! id: 78, active: true
# Book.update! id: 79, active: true
# Book.update! id: 80, active: true
# Book.update! id: 81, active: true
# Book.update! id: 82, active: true
# Book.update! id: 83, active: true
# Book.update! id: 84, active: true
# Book.update! id: 85, active: true
# Book.update! id: 86, active: true
# Book.update! id: 87, active: true
# Book.update! id: 88, active: true
# Book.update! id: 89, active: true
# Book.update! id: 90, active: true
# Book.update! id: 91, active: true
# Book.update! id: 92, active: true
# Book.update! id: 93, active: true
# Book.update! id: 94, active: true
# Book.update! id: 95, active: true
# Book.update! id: 96, active: true
# Book.update! id: 97, active: true
# Book.update! id: 98, active: true
# Book.update! id: 99, active: true
# Book.update! id: 100, active: true
# Book.update! id: 101, active: true
# Book.update! id: 102, active: true
# Book.update! id: 103, active: true
# Book.update! id: 103, active: true
# Book.update! id: 104, active: true
# Book.update! id: 105, active: true
# Book.update! id: 106, active: true
# Book.update! id: 107, active: true
# Book.update! id: 108, active: true
# Book.update! id: 109, active: true
# Book.update! id: 110, active: true
# Book.update! id: 111, active: true
# Book.update! id: 112, active: true
# Book.update! id: 113, active: true
# Book.update! id: 114, active: true
# Book.update! id: 115, active: true
# Book.update! id: 116, active: true
# Book.update! id: 117, active: true
# Book.update! id: 118, active: true
# Book.update! id: 119, active: true
# Book.update! id: 120, active: true


require 'csv'
namespace :books do
  desc "Create tornadoes tables"
  task seed_books: :environment do

Book.destroy_all


CSV.foreach("lib/assets/Books.csv", :headers =>true) do |row|


  Book.create!(
  title: row[4],#
  author: row[2],#
  year: row[3].to_i,#
  isbn: row[1].to_i,#
  region: row[5],
  rating: row[6].to_f,
  price: row[7].to_f,
  image: row[8],
  active: row[9] default: true
)
end
end
end
