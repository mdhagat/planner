class User < ActiveRecord::Base
  has_one :profile
  has_one :preference
  has_many :plans
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end
  
  def self.authenticate(name, password)
    logger.info '***********in authenticate***********'
    user = self.find_by_name(name)
    if user
      logger.info '*** found name ***'
      expected_password = encrypted_password(password, user.salt)
      logger.info 'expected_password: '+expected_password
      logger.info 'hashed_password: '+user.hashed_password
      if user.hashed_password != expected_password
        logger.info '*** password does not match ***'
        user = nil
      end
    end
    logger.info '*** returning user ***'
    user
  end
  
  # 'password' is a virtual attribute
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  private

  def self.encrypted_password(password, salt)
    logger.info '***********in encrypted_password***********'
    string_to_hash = password + "wibble" + salt # 'wibble' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  
  
  
end
