class User < ActiveRecord::Base
  
  attr_accessor :skip_pass_validation

  mount_uploader :avatar, AttachmentUploader
  before_save { self.email = email.downcase }
  validates :fname, presence: true, length: { maximum: 50 }
  validates :lname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true,format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :username, presence:true,uniqueness: {case_sensitive:false}
  has_secure_password
  validates :password, length: { minimum: 6 }, unless: :skip_pass_validation

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

  

end
