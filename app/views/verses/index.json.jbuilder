json.array!(@verses) do |verse|
  json.extract! verse, :id, :vote_count, :chapter_id, :book_id, :content, :user_id
  json.url verse_url(verse, format: :json)
end
