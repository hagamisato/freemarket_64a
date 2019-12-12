class SignupController < ApplicationController
  def top
    @user = User.new

  end

  def reg
    @user = User.new

  end

  def tell
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:password_confirmation] = params[:user][:password_confirmation]
    session[:f_name_kanji] = params[:user][:f_name_kanji]
    session[:l_name_kanji] = params[:user][:l_name_kanji]
    session[:f_name_kana] = params[:user][:f_name_kana]
    session[:l_name_kana] = params[:user][:l_name_kana]
    session[:birth_year] = params[:user][:birth_year]
    session[:birth_month] = params[:user][:birth_month]
    session[:birth_day] = params[:user][:birth_day]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      f_name_kanji: session[:f_name_kanji],
      l_name_kanji: session[:l_name_kanji],
      f_nmae_kana: session[:f_name_kana],
      l_name_kana: session[:l_name_kana],
      birth_year: session[:birth_year],
      birth_maonth: session[:birth_month],
      birth_day: session[:birth_day],
    )
  end

  def add
    session[:phone_number] = params[:address][:phone_number]
    @adress = Address.new(
      phone_number: session[:phone_number],
    )
  end

  def pay
    session[:prefectures] = params[:address][:prefectures]
    session[:municipalities] = params[:address][:municipalities]
    session[:address] = params[:address][:address]
    session[:building] = params[:address][:building]
    @adress = Address.new(
      prefectures: session[:prefectures],
      municipalities: session[:municipalities],
      address: session[:address],
      building: session[:building],
    )
  end
  
  def finish
    session[:credit_number] = params[:credit_card][:credit_number]
    session[:lmit_month] = params[:credit_card][:limit_month]
    session[:limit_year] = params[:credit_card][:limit_year]
    session[:security_number] = params[:credit_card][:security_number]
    @credit_card = Credit_card.new(
      credit_number: session[:credit_number],
      lmit_month: session[:lmit_month],
      limit_year: session[:limit_year],
      security_number: session[:security_number],
    )
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:f_name_kanji,:l_name_kanji,:f_name_kana,:l_name_kana,:birth_year,:birth_month,:birth_day)
  end

  def address_params
    params.require(:address).permit(:phone_number,:prefectures,:municipalities,:address,:building)
  end

  def credit_card_params
    params.require(:credit_card).permit(:credit_number,:lmit_month,:limit_year,:security_number)
  end

end
