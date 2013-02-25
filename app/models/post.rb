class Post < ActiveRecord::Base
  attr_accessible :body, :spam_status, :tag, :title, :town_from, :user_id
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :title, :body, :town_from, :presence => true
  validates :title, :length => { :minimum => 5}
  validates :title, :uniqueness => { :message => "already taken"}
  
end
