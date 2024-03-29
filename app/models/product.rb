class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
	
  validates :title, :image_url, :description, :presence => true

  validates :title, :uniqueness => true

  validates :image_url,
      allow_blank: true,
      format: {
        with:    %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
      }

  validates :price, numericality: {
    greater_than_or_equal_to: 0.1
    }
end
