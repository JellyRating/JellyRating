class User < ActiveRecord::Base

  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :avaliations
  has_many :recommendations, class_name: "Recommendation", foreign_key: "created_by_id"
  has_many :commentaries
  has_many :relationships

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def avaliation_count
    Avaliation.where(:user_id => self.id).count
  end

  def commentary_count
    Commentary.where(:user_id => self.id).count
  end

  def followed_recommendations
    Relationship.joins(:recommendations).where(recommendations: {created_by_id: followed_id})
  end

  def followers
    @followers= Array.new
    @relationships = Relationship.where(:followed_id =>self.id)
    @relationships.each do |r|
      @followers.push r.follower
    end
    return @followers
  end

  def followed
    @followed= Array.new
    @relationships = Relationship.where(:follower_id =>self.id)
    @relationships.each do |r|
      @followed.push r.followed
    end
    return @followed
  end


end