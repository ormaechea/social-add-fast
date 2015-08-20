class NetworksController < ApplicationController
  def show
  end

  def create
    @network = Network.create(network_params)
    redirect_to ''
  end

  def update
  end

  def destroy
  end

  private
  def network_params
    params.require(:network).permit(:name, :username, user_id: params[:user_id])
  end

end
