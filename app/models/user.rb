class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :commnents
  has_many :items, through: :user_items
  has_many :user_items
  has_one :address
  accepts_nested_attributes_for :address
  has_many :sns_credentials, dependent: :destroy
 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
         def self.find_oauth(auth)
          uid = auth.uid
          provider = auth.provider
          snscredential = SnsCredential.where(uid: uid, provider: provider).first 
      
         
          if snscredential.present?
            user = User.where(email: auth.info.email).first
            unless user.present?
              user = User.new(
              nickname: auth.info.name,
              email: auth.info.email,
              )
            end
            sns = snscredential
            { user: user, sns: sns}
          else
            user = User.where(email: auth.info.email).first
            if user.present?
              sns = SnsCredential.create(
                uid: uid,
                provider: provider,
                user_id: user.id
              )
      
              { user: user, sns: sns}
      
            
            else
              user = User.new(
              nickname: auth.info.name,
              email: auth.info.email,
              )
              sns = SnsCredential.new(
                uid: uid,
                provider: provider
              )
      
              { user: user, sns: sns}
            end
          end
        end

end