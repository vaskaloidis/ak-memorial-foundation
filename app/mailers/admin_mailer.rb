class AdminMailer < ApplicationMailer

def registration_notifications(customer)
  @customer = customer
  User.where(admin: true).each do |admin|
    mail(to: admin.email, subject: 'Athan Kaloidis Memorial: ' + customer.full_name + ' Registered for The Tournament')
  end
end

end
