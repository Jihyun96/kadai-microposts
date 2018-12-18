class BookmarksController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @microposts = current_user.bookmark_micropost.page(params[:page])
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to :back
  end
end
