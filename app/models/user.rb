class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessible :nombre , :provider , :uid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter,:facebook]

  def self.from_omniauth_twitter(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.nombre = auth.info.name
        # user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def self.from_omniauth_facebook(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.nombre = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

end
