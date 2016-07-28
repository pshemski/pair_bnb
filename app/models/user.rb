class User < ApplicationRecord
  include Clearance::User
  validates :email, uniqueness: true

  has_many :listings, dependent: :destroy
  has_many :payments, through: :reservations
  has_many :reservations, dependent: :destroy
  has_many :authentications, :dependent => :destroy
  mount_uploader :image, ImageUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      # u.first_name = auth_hash["info"]["first_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
      u.password = SecureRandom.hex(8)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
