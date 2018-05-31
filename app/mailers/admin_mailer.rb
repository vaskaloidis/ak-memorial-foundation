class AdminMailer < ApplicationMailer

  def registration_notifications
    @customer = User.find(params[:customer_id])
    admins = User.where(admin: true).collect(&:email).join(',')

    subject = 'Athan Kaloidis Memorial Foundation ' + @customer.full_name + ' Registered for The Tournament'
    
    unless Rails.env.production?
      subject = '(TEST) ' + subject
    end

    mail(to: admins, subject: subject)
  end

  def purchase_notification
    @purchase = Purchase.find(params[:purchase])
    admins = User.where(admin: true).collect(&:email).join(',')

    subject = 'Athan Kaloidis Memorial Foundation: ' + @purchase.user.full_name + ' '
    subject += case @purchase.product_category
               when 'golf_package'
                 'Purchased a Golfer-Package ($150)'
               when 'donation'
                 'Purchased a Donation of ($' + @purchase.amount.to_s + ')'
               when 'sponsor'
                 'Purchased the ' + @purchase.product.name + ' ($' + @purchase.product.price.to_s + ') Sponsorship Package'
               end

    unless Rails.env.production?
      subject = '(TEST) ' + subject
    end

    mail(to: admins, subject: subject)
  end

end
