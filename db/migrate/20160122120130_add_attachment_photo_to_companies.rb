class AddAttachmentPhotoToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :companies, :photo
  end
end
