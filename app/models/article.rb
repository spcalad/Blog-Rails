class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true, length: { minimum: 15 }
end
