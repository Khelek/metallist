class UserRegistrationType < User
  include BasicType

  attr_accessible :password_confirmation

  #has_secure_password

  validates_each :password do |record, attr, value|
    unless value =~ /^.{5,30}$/
      record.errors.add(attr, I18n.t(:password_not_valid, scope: [:activerecord, :errors, :messages]))
    end
  end
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end

end
