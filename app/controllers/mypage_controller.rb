class MypageController < ApplicationController

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
    card = Card.where(user_id: current_user.id)
    redirect_to card_path(current_user.id) if card.exists?
  end

  def logout
  end
  
end
