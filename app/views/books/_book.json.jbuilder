json.extract! book, :id, :title, :author, :year, :isbn, :region, :rating, :price, :image, :created_at, :updated_at
json.url book_url(book, format: :json)
