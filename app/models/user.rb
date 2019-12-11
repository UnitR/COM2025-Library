class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Model references
  has_many :comments
  has_many :forum_posts
  belongs_to :role

  before_validation :set_default_role

  private
  def set_default_role
    self.role_id ||= Role.find_by_name(ROLE_REG).id
  end
end