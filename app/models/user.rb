class User < ActiveRecord::Base
  has_many :teams, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :memberof, through: :relationships, source: :team
	has_many :owns, dependent: :destroy
  attr_accessor :team

  serialize :peer_evaluation, Hash

  attr_accessor :remember_token, :reset_token 
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_UIN_REGEX = /\d/
  validates :uin ,presence: true,length:{ maximum: 9},
                  format: { with: VALID_UIN_REGEX },
                  uniqueness:{ case_sensitive:false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :semester,presence: true
  validates :year,presence: true
  validates :course,presence: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token. CLass Method
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions. Instance method
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def join_team(team)
    relationships.create(team_id: team.id)
  end

  def leave_team(team)
    relationships.find_by(team_id: team.id).destroy
  end

  def is_member?(team)
    memberof.include?(team)
  end

  def is_member_of
    r = relationships.find_by(user_id: self.id)
    if r
      Team.find_by(id: r.team_id)
    end
  end
  
   # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
    private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

end
  
