class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update ]
  before_action :guard_action_not_current_user, only: [:edit, :update]

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "userを編集しました！"
    else
      render :edit
    end
  end

  # private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :image, :image_cache )
  end
  # def user_params_update
  #   params.require(:user).permit(:name, :email)
  # end
  def set_user
    @user = User.find(params[:id])
  end

  def guard_action_not_current_user
    if current_user.id != @user.id
      redirect_to user_path(@user.id), notice:"他の方のprofileは変更できません"
    end
  end
end
