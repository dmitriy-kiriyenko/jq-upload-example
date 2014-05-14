class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :user
  mount_uploader :src, ImageUploader

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:src),
      "size" => src.size,
      "url" => src.url,
      "thumbnail_url" => src.thumb.url,
      "delete_url" => image_path(:id => id),
      "delete_type" => "DELETE"
    }
  end
end
