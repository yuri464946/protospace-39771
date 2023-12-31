class PrototypesController < ApplicationController
  before_action :require_login, only: [:new,:edit,:destroy]
  before_action :user_confirm, only: [:edit]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render  :edit, status: :unprocessable_entity

    end

  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end
  
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  
  def prototype_params
    params.require(:prototype).permit(:content, :image, :title,:catch_copy,:concept).merge(user_id: current_user.id)
  end

  def require_login
    unless user_signed_in?
      redirect_to  action: :index
    end
  end

  def user_confirm
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id
      redirect_to  action: :index
    end
  end
end
