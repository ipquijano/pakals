module CommentsHelper
	def toggle_spam_comment(comment, user)
		if user.flagged?(comment, :spam_comment)
			link_to  "Unmark as Spam", spam_comment_path(comment)
		else
			link_to  "Mark as Spam", spam_comment_path(comment)
		end
	end
end
