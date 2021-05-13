class LikesController < ApplicationController

  def create
    @like = Like.new(gossip_id:params[:gossip_id],user_id:current_user.id)
    if @like.save
    redirect_to request.referrer 
    else
    redirect_to request.referrer
    end     
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to request.referrer
  end 

end
