class PurchasesController < ApplicationController

  def show
    @item = Item.find(params[:id])
    # product = Product.find(card_params[:product_id])
    card = Card.find_by(user_id: current_user.id)
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
  end


  def pay
    @item = Item.find(params[:id])
    # @item = Item.find_by(params[:id])
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = "sk_test_e2bdfe749051b2466f069f55"
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id,  
    currency: 'jpy', 
  )
  redirect_to action: 'done' #完了画面に移動
  # redirect_to done_purchases_path(params[:id])
  end

  def done
    @item = Item.find(params[:id])
  end
end






  # def index
  #   @item = Item.find(params[:id])
  #   card = Card.find_by(user_id: current_user.id)
  #   #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
  #   if card.blank?
  #     #登録された情報がない場合にカード登録画面に移動
  #     redirect_to controller: "cards", action: "new"
  #   else
  #     Payjp.api_key = "sk_test_e2bdfe749051b2466f069f55"
  #     #保管した顧客IDでpayjpから情報取得
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end