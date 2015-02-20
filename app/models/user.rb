class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]

  belongs_to :restaurant
  has_many :orders
  has_many :items, through: :orders

  mount_uploader :avatar, ImageUploader

  validates :name, :email, presence: true

  DORADO = 'dorado'
  CLAYTON = 'clayton'


  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
      end
    end
  end

  def is_admin?
    self.admin
  end
end
