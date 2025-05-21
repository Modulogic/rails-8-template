# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  transcript  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  uploader_id :bigint
#
# Indexes
#
#  index_videos_on_uploader_id  (uploader_id)
#
# Foreign Keys
#
#  fk_rails_...  (uploader_id => users.id)
#
class Video < ApplicationRecord
  belongs_to :uploader, class_name: "User"

  has_one_attached :video_file

  validate :video_file_must_be_video

  private

  def video_file_must_be_video
    return unless video_file.attached?

    unless video_file.blob.content_type.start_with?("video/")
      errors.add(:video_file, "must be a video file")
    end
  end
end
