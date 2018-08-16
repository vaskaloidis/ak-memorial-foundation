class User < ApplicationRecord
  # include Discard::Model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shopping_cart, dependent: :destroy
  has_many :shopping_cart_items, :source => :product, :through => :shopping_cart, dependent: :destroy

  has_many :admin_purchases, :class_name => 'Purchase', :foreign_key => 'admin_id', dependent: :nullify
  has_many :purchases, :class_name => 'Purchase', :foreign_key => 'user_id', dependent: :nullify
  has_many :purchased_items, :source => :product, :through => :purchases, dependent: :nullify

  has_many :invites, dependent: :destroy

  accepts_nested_attributes_for :shopping_cart
  accepts_nested_attributes_for :shopping_cart_items
  accepts_nested_attributes_for :purchases
  accepts_nested_attributes_for :invites

  # Validations
  validate :validate_name
  validate :validate_golfer2
  validate :validate_golfer3
  validate :validate_golfer4
  validates :email, presence: true
  validates :phone, presence: true

  def self.customers
    where(admin: false).all
  end

  # TODO: Move this to helper
  def full_address
    result = ''
    unless address.nil?
      result += address + ', '
    end
    unless city.nil?
      result += city + ', '
    end
    unless state.nil?
      result += state
    end
    unless zip.nil?
      result += zip
    end
    result
  end

  def full_name
    if !first_name.nil? and !last_name.nil?
      first_name + ' ' + last_name
    else
      if !first_name.nil? or !last_name.nil?
        first_name unless first_name.nil?
        last_name unless last_name.nil?
      else
        email
      end
    end
  end

  def is_god?
    (email == 'vas.kaloidis@gmail.com')
  end

  def group_member
    membership = Array.new
    User.where(golfer2_email: self.email).all.each do |member|
      membership << member
    end
    User.where(golfer3_email: self.email).all.each do |member|
      unless membership.include?(member)
        membership << member
      end
    end
    User.where(golfer3_email: self.email).all.each do |member|
      unless membership.include?(member)
        membership << member
      end
    end
    membership
  end

  def add_to_cart(product)
    shopping_cart.create(product: product)
  end

  def cart_total
    total = 0.0
    self.shopping_cart.each do |item|
      total += item.product.price
    end
    total
  end

  def cart_contains_golf_package?
    shopping_cart_items.include?(Product.golf_package)
  end

  def purchased_golf_package?
    purchased?(Product.golf_package)
  end

  def cart_contains?(product)
    shopping_cart.include?(product)
  end

  def purchased?(product)
    purchased_items.include?(product)
  end

  def self.golfer_status(email)
    if !User.where(email: email).empty?
      user = User.where(email: email).first
      if user.purchased?(Product.golf_package)
        'Incomplete'
      else
        'Registered'
      end
    else
      'Un-Registered'
    end
  end

  def self.account_exists?(email)
    a = User.where(email: email)
    return false if a.empty?
    a.first
  end

  # TODO: Move to helper
  def self.golfer_status_icon(email)
    user = self.account_exists?(email)
    if user
      if user.purchased_golf_package?
        return '<i class="fas fa-dollar-sign"></i>'.html_safe
      else
        return '<i class="fas fa-check"></i>'.html_safe
      end
    else
      return '<i class="fas fa-exclamation-circle"></i>'.html_safe
    end
  end


  # Validations
  def validate_name
    unless first_name.blank? and last_name.blank?
      if first_name.blank?
        errors.add(:first_name, 'First Name Cannot Be Left Empty')
      end
      if last_name.blank?
        errors.add(:last_name, 'Last Name Cannot Be Left Empty')
      end
    end
  end

  def validate_golfer2
    empty_error = 'Cannot Be Empty'
    unless golfer2_name.blank? and golfer2_email.blank?
      if golfer2_name.blank?
        errors.add(:golfer2_name, empty_error)
      end
      if golfer2_email.blank?
        errors.add(:golfer2_email, empty_error)
      end
    end
  end

  def validate_golfer3
    empty_error = 'Cannot Be Empty'
    unless golfer3_name.blank? and golfer3_email.blank?
      if golfer3_name.blank?
        errors.add(:golfer3_name, empty_error)
      end
      if golfer3_email.blank?
        errors.add(:golfer3_email, empty_error)
      end
    end
  end

  def validate_golfer4
    empty_error = 'Cannot Be Empty'
    unless golfer4_name.blank? and golfer4_email.blank?
      if golfer4_name.blank?
        errors.add(:golfer4_name, empty_error)
      end
      if golfer4_email.blank?
        errors.add(:golfer4_email, empty_error)
      end
    end
  end

  # Invitations
  # TODO: Refactor this when we do invites this is horrible and repetitive garbage
  def invite_golfer_two
    unless self.golfer2_email.nil?
      if !User.where(email: self.golfer2_email).empty?
        logger.debug('Golfer 2 ' + self.golfer2_email + ' does not exist yet. Invite!')

        invite = Invite.new
        invite.user = self
        invite.email = golfer2_email
        invite.golfer_number = 2
        unless self.golfer2_name.nil?
          invite.name = golfer2_name
        end
        invite.save

        if !self.golfer2_name.nil?
          logger.debug('Invite Sent To Golfer Two ' + invite.email + ' ' + invite.name)
        else
          logger.debug('Invite Sent To Golfer Two ' + invite.email)
        end

        # mailer = InviteUsersMailer.invite_users(invite).deliver_later
        # logger.debug(mailer)
      else
        logger.debug("Golfer 2 Exists")
      end
    end
  end

  def invite_golfer_three
    unless self.golfer3_email.nil?
      if !User.where(email: self.golfer3_email).empty?
        logger.debug('Golfer 3 ' + self.golfer2_email + ' does not exist yet. Invite!')
        invite = Invite.new
        invite.email = golfer3_email
        invite.user = self
        invite.golfer_number = 3
        unless self.golfer3_name.nil?
          invite.name = golfer4_name
        end
        invite.save

        if !self.golfer3_name.nil?
          logger.debug('Invite Sent To Golfer Three ' + invite.email + ' ' + invite.name)
        else
          logger.debug('Invite Sent To Golfer Three ' + invite.email)
        end

        mailer = InviteUsersMailer.invite_users(invite).deliver_later
        logger.debug(mailer)
      else
        logger.debug("Golfer 3 Exists")
      end

    end
  end

  def invite_golfer_four
    unless self.golfer4_email.nil?
      if !User.where(email: self.golfer4_email).empty?
        logger.debug('Golfer 4 ' + self.golfer4_email + ' does not exist yet. Invite!')
        invite = Invite.new
        invite.email = golfer4_email
        invite.user = self
        invite.golfer_number = 4
        unless self.golfer4_name.nil?
          invite.name = golfer4_name
        end
        invite.save

        if !self.golfer4_name.nil?
          logger.debug('Invite Sent To Golfer Four ' + invite.email + ' ' + invite.name)
        else
          logger.debug('Invite Sent To Golfer Four ' + invite.email)
        end

        mailer = InviteUsersMailer.invite_users(invite).deliver_later

        logger.debug(mailer)
      else
        logger.debug("Golfer 4 Exists")
      end
    end
  end

end
