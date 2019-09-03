class ContentsController < ApplicationController
  def index ; end

  def create
    TenMinutesWaitJob.set(queue: params[:queue]).perform_later
    redirect_to contents_path
  end
end
