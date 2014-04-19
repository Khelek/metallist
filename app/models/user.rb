class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :state, :admin

  has_many :notifications
  has_many :items

  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  state_machine :state, initial: :new do
    state :new
    state :active
    state :inactive

    event :activate do
      transition [:inactive, :new] => :active
    end

    event :deactivate do
      transition [:active, :new] => :inactive
    end

  end

  def authenticate(password)
    self.password_digest == Digest::MD5.hexdigest(password)
  end

  def password=(password)
    if password.present?
      @real_password = password
      self.password_digest = Digest::MD5.hexdigest(password)
    end
  end

  def password
    @real_password
  end

  def guest?
    false
  end
end
