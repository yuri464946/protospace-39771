class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype=Prototype.new
  end
  def prototypes_params
    params.require(:prototypes).permit(:content, :image, :title,:catch_copy).merge(user_id: current_user.id)
  end
end
