class NotifObserver < ActiveRecord::Observer
	observe :comment, :post, :like, :user

	def after_save(comment)
		Notifications.deliver_comment("admin@do.com", sender_id, "New comment was posted", comment)  --populate notif table--
    end

    def after_create(user)
      user.logger.info('New user signed up!')
    end

    def after_destroy(user)
      user.logger.warn("User with an id of #{user.id} was destroyed!")
    end

    observe :user

  def after_create(user)
    if user.purchased_membership?
      GreetingMailer.welcome_and_thanks_email(user).deliver
    else
      GreetingMailer.welcome_email(user).deliver
    end
  end
end



rails g controller notifs

rails g model notif 
recipient_id:integer 
sender_id: integer
notif_body: time
read_at: boolean


BUHATUNON SA MODEL:
class NotifObserver < ActiveRecord::Observer
observe :comment, :post, :like, :user

  def after_save(comment)
    Notifications.deliver_comment("admin@do.com", sender_id, "New comment was posted", comment)  --populate notif table--
  end

:recipient_id => current_user.id, :read_at => nil