class Place < ActiveRecord::Base

  mount_uploader :image, ImageUploader
end
