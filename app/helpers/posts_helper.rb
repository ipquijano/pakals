module PostsHelper

	def toggle_spam(post, user)
		if user.flagged?(post, :spam)
			link_to  "Unmark as Spam", mark_spam_post_path(post)
		else
			link_to  "Mark as Spam", mark_spam_post_path(post)
		end		
	end

	def toggle_like(post, user)
		if user.flagged?(post, :like)
			link_to  "Unlike", like_post_path(post)
		else
			link_to  "Like", like_post_path(post)
		end	
	end

	
end
