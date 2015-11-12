class ChangeImageNameOnBusinessHighlight < ActiveRecord::Migration
  def change
    rename_column :business_highlights, :image, :image_1
    rename_column :business_highlights, :image_alt, :image_1_alt
  end
end
