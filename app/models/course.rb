class Course < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :users

  validates :name, :description, presence: true
end
