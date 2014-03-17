class User < ActiveRecord::Base
  extend Enumerize
  attr_accessible :email, :first_name, :last_name, :password

  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  enumerize :role, in: [ :admin, :user ], default: :user
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

  def admin?
    self.role.admin?
  end
end
