class SharesController < ApplicationController
  def create
    @s = Share.create!(share_params)
    head :ok
  end

  def index
    @users_not_shared = User.all.to_a
    shares = Share.where(list_id: params[:list_id].to_i).to_a
    shares.map! { |share| share.user_id }
    shares << List.find_by_id(params[:list_id]).user_id
    @users_not_shared.reject! { |x| shares.include? x.id }
  end

  private   
  def share_params
    params.permit(:user_id, :list_id)
  end
end
