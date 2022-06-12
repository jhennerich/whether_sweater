class Image
  attr_reader :image

  def initialize(data, location)
   @image = image_hash(data, location)
  end

  def image_hash(data, location)
    {
      location: location,
      image_url: data[:urls][:regular],
      credit: credit_hash(data)
    }
  end

  def credit_hash(data)
    {
      source: data[:links][:self],
      author: data[:user][:name]
    }
  end
end
