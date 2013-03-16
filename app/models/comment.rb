class Comment < ActiveRecord::Base
	belongs_to :post, :dependent => :destroy
	belongs_to :user
	#make_flaggable :spam_comment
end
