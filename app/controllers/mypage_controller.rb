class MypageController < ApplicationController
  before_action :set_user

  def index
  end
  
  def show

  end

  def profile
  end

  def identification
    @address = Address.find_by(user_id: current_user.id)
  end

  def card
  end

  def logout
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
