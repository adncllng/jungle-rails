class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings
  
  validates :password_confirmation, presence: true
  validates :password, presence: true, length: { in: 4..40 }
  validates :name, presence: true
  validates :email, presence: true,
                     format: {with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i},
                     uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    if user = User.find_by_email(email.strip.downcase)
      user unless !user.authenticate(password)
    end
  end
end
