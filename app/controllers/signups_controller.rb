class SignupsController < ApplicationController
  def top
    @user = User.new

  end

  def reg
    @user = if session[:password_confirmation]
      User.new(
        nickname: session[:nickname],
        email: session[:email],
        password_confirmation: session[:password_confirmation]
      )
    else
      User.new
    end
    # @user = User.new
  end

  def tell
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:password_confirmation] = params[:user][:password]
    session[:f_name_kanji] = params[:user][:f_name_kanji]
    session[:l_name_kanji] = params[:user][:l_name_kanji]
    session[:f_name_kana] = params[:user][:f_name_kana]
    session[:l_name_kana] = params[:user][:l_name_kana]
    session[:birth_year] = params[:user][:birth_year]
    session[:birth_month] = params[:user][:birth_month]
    session[:birth_day] = params[:user][:birth_day]
    @user = User.new
  end

  def add
    session[:phone_number] = params[:user][:phone_number]
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password],
      f_name_kanji: session[:f_name_kanji],
      l_name_kanji: session[:l_name_kanji],
      f_name_kana: session[:f_name_kana],
      l_name_kana: session[:l_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number]
    )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      SnsCredential.create(
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )    
<<<<<<< HEAD
<<<<<<< HEAD
      # session[:user_id] = @user.id
      sign_in User.find(@user.id) unless user_signed_in?
      redirect_to root_path
=======
      sign_in User.find(settion[:id]) unless user_signed_in?
      redirect_to new_card_path

>>>>>>> 63303d65a3c2a26eda5dd61f0e3669fd509f5464
=======
      sign_in User.find(settion[:id]) unless user_signed_in?
      redirect_to new_card_path

>>>>>>> 63303d65a3c2a26eda5dd61f0e3669fd509f5464
    else
      render '/signups/reg'
    end
  end
    

    private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :f_name_kanji,
      :l_name_kanji,
      :f_name_kana,
      :l_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number,
      address_attributes: [:id, :postal_code, :prefectures, :municipalities, :address, :building,]
    )
  end
end
    

