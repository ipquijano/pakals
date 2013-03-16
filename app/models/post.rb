class Post < ActiveRecord::Base
  # make_flaggable :spam, :like
  attr_accessible :body, :spam_status, :tag, :title, :town_from, :user_id, :reputation, :videolink
  belongs_to :user
  has_many :comments, :dependent => :destroy
  #has_many :spam_posts, :dependent => :destroy
  #has_many :user, :through => :spam_posts



  validates :title, :body, :town_from, :presence => true
  validates :title, :length => { :minimum => 5}
  validates :title, :uniqueness => { :message => "already taken"}

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
