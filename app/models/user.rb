class User < ActiveRecord::Base
  has_many :comments
  has_many :articles

  authenticates_with_sorcery!

  validates_confirmation_of :password, message: "asd", if: :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
