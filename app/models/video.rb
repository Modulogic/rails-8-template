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
#
class Video < ApplicationRecord
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
