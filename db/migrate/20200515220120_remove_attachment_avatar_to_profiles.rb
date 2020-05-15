class RemoveAttachmentAvatarToProfiles < ActiveRecord::Migration[5.2]
  def up
    remove_attachment :profiles, :avatar
  end

  def down
    add_attachment :profiles, :avatar
  end
end