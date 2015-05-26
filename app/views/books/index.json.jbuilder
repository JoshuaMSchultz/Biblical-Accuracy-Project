json.array!(@books) do |book|
  json.extract! book, :id, :name, :order_id
  json.url book_url(book, format: :json)
end
