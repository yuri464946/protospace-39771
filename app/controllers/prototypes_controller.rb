class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype=Prototype.new
  end

  def create
    @prototype=Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    redirect_to root_path
  end


  private
  
  def prototype_params
    params.require(:prototype).permit(:content, :image, :title,:catch_copy,:concept).merge(user_id: current_user.id)
  end









  
end
