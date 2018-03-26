class User < ActiveRecord::Base
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable and :omniauthable, :confirmable,
  # :recoverable, :trackable,
  enum role: [:user, :moderator, :admin]

  devise :database_authenticatable, :registerable, :validatable, :rememberable
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end


