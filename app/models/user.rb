class User < ActiveRecord::Base
  validates :name, presence: true, null: false

  has_one :user_preference
end
