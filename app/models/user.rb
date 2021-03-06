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
  has_many :follows, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followings, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followers, through: :follows, source: :follower
  has_many :followed, through: :followings, source: :followed


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

  def relationships
    @relationships = Array.new
    self.follows.each do |follow|
      @relationships.push follow
    end
    self.followings.each do |following|
      @relationships.push following
    end
    return @relationships
  end

  def followship(user)
    @relationship = Relationship.where(:follower=>self, :followed=>user).first
  end

  def follows? (user)
    @relationship = Relationship.where(follower: self, followed: user)
    return @relationship.length!=0        
  end

  def followed_avaliations
    Avaliation.where(:user_id => followed)
  end

  def followed_recommendations
    Recommendation.where(:created_by_id => followed)
  end

  def followed_commentaries
    Commentary.where(:user_id => followed)
  end

  def timeline
    timeline_list = Array.new
    followed_avaliations.each do |avaliation|
      timeline_list << avaliation
    end

    followed_recommendations.each do |recommendation|
      timeline_list  << recommendation
    end

    followed_commentaries.each do |commentary|
      timeline_list  << commentary
    end
    timeline_list.sort {|x,y| y.updated_at <=> x.updated_at}
  end  
end