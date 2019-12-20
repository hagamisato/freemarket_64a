class PurchasesController < ApplicationController
  before_action :set_item

  def show
    card = current_user.card
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = "sk_test_e2bdfe749051b2466f069f55"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    @address = Address.find_by(user_id: current_user.id)
  end


  def pay
    card = current_user.card
    Payjp.api_key = "sk_test_e2bdfe749051b2466f069f55"
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id,  
    currency: 'jpy', 
  )
  @item.update(buyer_id: current_user.id)  #buyer_idを追加する
  redirect_to action: 'done' #完了画面に移動
  end

  def done
  end

  def set_item
    @item = Item.find(params[:id])
  end
end





