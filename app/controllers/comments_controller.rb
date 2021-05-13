class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :super_user ,only: [:edit,:update,:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(content:params[:content],gossip_id:params[:gossip_id],user_id:session[:user_id])
    if @comment.save
      redirect_to gossip_path(params[:gossip_id]), notice: "Le commentaire a bien été créé !"
    else
      flash.now[:messages] = @comment.errors.full_messages
      redirect_to gossip_path(params[:gossip_id]) 
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      redirect_to gossip_path(params[:gossip_id]), notice: "Le commentaire a bien été modifié !"
    else
      flash.now[:messages] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id), notice: "Le commentaire a bien été détruit !"
  end

  private

  def post_params
    params.require(:comment).permit(:content)
  end

  def super_user
    unless current_user == Comment.find(params[:id]).user
      flash[:danger] = "Vous n'êtes pas le créateur de ce commentaire....Si oui, prouvez le"
      redirect_to new_session_path
    end
  end
  
end
