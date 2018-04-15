class InviteUsersMailer < ApplicationMailer
  layout 'mailer'

  def invite_users(invite)

    @user = invite.user
    @email = invite.email
    @name = invite.name
    @invite = invite

    mail(to: @email, subject: 'Athen Kaloidis Memorial - ' + @user.first_name + ' ' + @user.last_name + ' Added You To His Golf Tournament Group ')
  end

  def notify_registered(registered)

    User.all.where(golfer2_email: registered.email) do |member|
      notified = User.find(registered.email)

      mail(to: notified.email, subject: 'Athen Kaloidis Memorial Golf Tournament - ' + registered.first_name + ' ' + registered.last_name + ' has registered for the Tournament')
    end

  end

end
