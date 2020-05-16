class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_one_attached :avatar
  
  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                          message: "must be a valid image format" },
                                    size: { less_than: 5.megabytes,
                                          message: "should be less than 5MB" }
                                          
  # Returns a resized image for display.
  def display_avatar
    avatar.variant(combine_options: {
      auto_orient: true,
      gravity: "center",
      resize: "250x250^",
      crop: "250x250+0+0"
      })
  end
end