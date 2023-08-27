class Book < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  
  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }, presence: true
end
