class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  serialize :following, Array
  has_many :tweets

  validates :username, presence: true
  validates :username, uniqueness: true

end
