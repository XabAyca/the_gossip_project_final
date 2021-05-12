class GossipsController < ApplicationController

  def index 
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(content:params[:content],title:params[:title],user_id:11)
    if @gossip.save
      redirect_to root_path, notice: "Le potin '#{@gossip.title.capitalize}' a bien été créé ! Félicitation"
    else
      flash.now[:messages] = @gossip.errors.full_messages
      render new_gossip_path
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit 
    @gossip = Gossip.find(params[:id])
  end

  def update 
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      redirect_to gossip_path(params[:id]), notice: "Le potin '#{@gossip.title.capitalize}' a bien été modifié !"
    else
      flash.now[:messages] = @gossip.errors.full_messages
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: "Le potin '#{@gossip.title.capitalize}' a bien été détruit !"
  end

  private

  def post_params
    params.require(:gossip).permit(:title,:content,)
  end


    
end
