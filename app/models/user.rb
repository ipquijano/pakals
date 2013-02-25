class User < ActiveRecord::Base
  attr_accessible :address, :birthdate, :contact_num, :email, :name, :reputation, :tag, :usertype, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password
  has_many :posts
  has_many :comments

  validates_confirmation_of :password, :on => :create
  validates_presence_of :password, :on => :create
  validates :name,  :address, :email, :presence  => true
  validates :name, :length => {:minimum => 2}
  validates :password, :length => {:minimum => 5} , :on => :create
  validates_numericality_of :contact_num
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
 
  def encrypt_password
  	if password.present?
		  self.password_salt = BCrypt::Engine.generate_salt
		  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	  end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) 
      user
    else
      nil
    end 
  end

end
