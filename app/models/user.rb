class User < ApplicationRecord
  belongs_to :role
  before_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]
  
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
                      message: 'domain must be atos.net',
                      with: /\A[\w+-.]+@gmail.com\z/i
                    }
                    
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('igniter')
  end
end
