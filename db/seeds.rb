# Athen Kaloidis Memorial Golf Tournament Seeds

unless Rails.env.production?
  User.delete_all
  Product.delete_all
  ShoppingCart.delete_all
end

# Me
c1 = User.new
c1.first_name = 'Vas'
c1.last_name = 'Kaloidis'
c1.phone = '8607707925'
c1.email = 'vas.kaloidis@gmail.com'
pass = 'password'
c1.password = pass
c1.password_confirmation = pass
c1.admin = true
c1.save

# Vasi
c1 = User.new
c1.first_name = 'Vasi'
c1.last_name = 'Kaloidis'
c1.phone = '2032066332'
c1.email = 'vasi@vasisrestaurant.com'
pass = 'Vasis2018!'
c1.password = pass
c1.password_confirmation = pass
c1.admin = true
c1.save

# Johnny
c1 = User.new
c1.first_name = 'John'
c1.last_name = 'Kaloidis'
c1.phone = '2035181989'
c1.email = 'john@kaloidislaw.com'
pass = 'Law2018!'
c1.password = pass
c1.password_confirmation = pass
c1.admin = true
c1.save
# Kim Karas
c1 = User.new
c1.email = 'krk0380@yahoo.com'
pass = 'Karas2018!'
c1.password = pass
c1.password_confirmation = pass
c1.admin = true
c1.save

# Products
p = Product.new
p.name = 'Tournament Sponsor'
p.description = 'Recognition as a major tournament sponsor, two foursomes, sponsor banner, four tee signs, Winners’ Circle flag, and program ad.'
p.price = 5000
p.category = 'sponsor'
p.save
p = Product.new
p.name = 'Win Sponsor'
p.description = 'Recognition as a major sponsor, two foursomes, sponsor banner, four tee signs, Winners’ Circle flag, and program ad.'
p.price = 2500
p.category = 'sponsor'
p.save
p = Product.new
p.name = 'Place Sponsor'
p.description = 'One foursome, sponsor banner, tee sign, Winners’ Circle flag, and program ad.'
p.price = 1000
p.category = 'sponsor'
p.save
p = Product.new
p.name = 'Show Sponsor'
p.description = 'Tee sign, sponsor banner, Winners’ Circle flag, and program ad.'
p.price = 500
p.category = 'sponsor'
p.save
p = Product.new
p.name = "Winner's Circle"
p.description = 'Flag prominently displayed at registration and dinner, and program ad.'
p.price = 150
p.category = 'sponsor'
p.save
p = Product.new
p.name = 'Hole Sponsor'
p.description = 'Tee sign and program ad.'
p.price = 100
p.category = 'sponsor'
p.save
p = Product.new
p.name = 'Program Sponsor'
p.description = ''
p.price = 50
p.category = 'sponsor'
p.save
p = Product.new
p.name = 'Golfer Package'
p.description = 'Green Fees, Golf Cart, Lunch, Beverages, Special Gift, Dinner'
p.price = 150
p.category = 'golf_package'
p.save
p = Product.new
p.name = 'Donation'
p.description = 'Donate any amount to the Athen Kaloidis Memorial Foundation.'
p.category = 'donation'
p.save


# Finished
puts "Memorial Foundation Seeds Executed"
