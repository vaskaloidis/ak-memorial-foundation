FactoryBot.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end
  factory(:base_user, class: 'User') do
    email
    password Faker::Internet.password
    password_confirmation {password.to_s}
    company_name {Faker::Company.name}
    company_published_name {"#{company_name} LLC."}
    company_website {"www.#{company_name}.com"}
    phone {Faker::PhoneNumber.phone_number}

    factory(:user) do
      first_name {Faker::Name.first_name}
      last_name {Faker::Name.last_name}
      fax {Faker::PhoneNumber.phone_number}
      address {Faker::Address.street_address}
      admin false
      city {Faker::Address.city}
      state {Faker::Address.state}
      zip {Faker::Address.zip_code}
      golfer2_email {Faker::Internet.email}
      golfer2_name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
      golfer3_email {Faker::Internet.email}
      golfer3_name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
      golfer4_email {Faker::Internet.email}
      golfer4_name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
      force_password_change false
      current_sign_in_at "2018-05-31T00:20 UTC"
      current_sign_in_ip {Faker::Internet.ip_v6_address}
      last_sign_in_at "2018-05-14T23:44 UTC"
      last_sign_in_ip {Faker::Internet.ip_v6_address}
      remember_created_at nil
      reset_password_sent_at nil
      reset_password_token nil
      sign_in_count 6
    end

    factory(:user_update) do
      first_name {Faker::Name.first_name}
      last_name {Faker::Name.last_name}
      phone {Faker::PhoneNumber.phone_number}
      fax {Faker::PhoneNumber.phone_number}
      address {Faker::Address.street_address}
      admin false
      city {Faker::Address.city}
      state {Faker::Address.state}
      zip {Faker::Address.zip_code}
      company_name {Faker::Company.name}
    end

    factory(:admin) do
      admin true
    end

    factory(:vas) do
      email 'vas.kaloidis@gmail.com'
    end


  end
end
