class AddUploaderToVideos < ActiveRecord::Migration[8.0]
  def change
add_reference :videos, :uploader, null: true, foreign_key: { to_table: :users }
  end
end
