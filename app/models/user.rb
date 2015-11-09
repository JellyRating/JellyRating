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


  # def timeline
  #   last_avaliations = []
  #   last_commentaries = []
  #   last_recommendations = []
  #   timeline = []
  #   self.avaliations.last_avaliations.each do |avaliation|
  #     last_avaliations << avaliation
  #   end
  #   self.commentaries.last_commentaries.each do |commentary|
  #     last_commentaries << commentary
  #   end
  #   self.recommendations.last_recommendations.each do |recommendation|
  #     last_recommendations << recommendation
  #   end
  #   until (last_commentaries.empty? and last_recommendations.empty? and last_avaliations.empty?)
  #     latest_commentary ||= last_commentaries.shift
  #     latest_recommendation ||= last_recommendations.shift
  #     latest_avaliation ||= last_avaliations.shift
  #     if compare_dates(latest_commentary, latest_recommendation)
  #       if compare_dates(latest_avaliation, latest_commentary)
  #         timeline << latest_avaliation
  #         latest_avaliation = nil
  #       else
  #         timeline << latest_commentary
  #         latest_commentary = nil
  #       end
  #     else
  #       if compare_dates(latest_avaliation, latest_recommendation)
  #         timeline << latest_avaliation
  #         latest_avaliation = nil
  #       else
  #         timeline << latest_recommendation
  #         latest_recommendation = nil
  #       end
  #     end          
  #   end
  #   return timeline
  # end

  # def compare_dates (object1, object2)
  #   return 0 unless object1.nil?
  #   return 1 unless object2.nil?
  #   return (object1.created_at > object2.created_at)
  # end
end