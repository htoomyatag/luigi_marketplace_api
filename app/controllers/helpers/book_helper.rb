module BookHelper
  def set_serializer(book)
    BookSerializer.new(book,include:[:user]).serializable_hash.to_json
  end
end