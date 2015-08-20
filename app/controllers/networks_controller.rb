class NetworksController < ApplicationController


  def show
  end

  def new
    @user = User.find(params[:user_id])
    @network = Network.new
    @network.user_id = @user.id
  end

  def index
   @user = User.find(params[:user_id])
   @networks = @user.networks
  end

  def create
    @network = Network.new(network_params)
    @network.user_id = params[:user_id]
    @network.save
    redirect_to action:"index", user_id: params[:user_id]
  end

 def edit
  @user = User.find(params[:user_id])
  @network = Network.find(params[:id])
 end

 def update
  @network = Network.find(params[:id])
     if @network.update(network_params)
     redirect_to action:"index", user_id: params[:user_id]
    else
      render 'edit'
    end
 end
  def destroy
     @network = Network.find(params[:id])
     @network.destroy
     render 'index'
  end

  private
  def network_params
    params.require(:network).permit(:name, :username)
  end

end
