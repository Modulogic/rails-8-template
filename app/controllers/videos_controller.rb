class VideosController < ApplicationController
  before_action :authenticate_user!
  def index
  @videos = Video.all.order(created_at: :desc)
end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video
    else
      render :new
    end
  end

  private

  def video_params
  params.require(:video)
        .permit(:title, :description, :transcript, :video_file)
end

end
