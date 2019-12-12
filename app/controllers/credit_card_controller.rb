class CreditCardController < ApplicationController
  
  require "payjp"
  
  def new
    credit_card = Credit_card.where(user_id: current_user.id)
    redirect_to action: "show" if credit_card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      credit_card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @credit_card = Credit_card.new(user_id: current_user.id, customer_id: customer.id, credit_card_id: customer.default_credit_card)
      if @credit_card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    credit_card = Credit_card.where(user_id: current_user.id).first
    if credit_card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    credit_card = Credit_card.where(user_id: current_user.id).first
    if credit_card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_credit_card_information = customer.credit_cards.retrieve(credit_card.credit_card_id)
    end
  end

end
