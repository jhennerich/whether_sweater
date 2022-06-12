class ImageFacade
  def self.get_image(location)
    image_info = ImageService.get_image_info(location)
    Image.new(image_info[:results][0], location)
  end
end
