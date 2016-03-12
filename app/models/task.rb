class Task < ActiveRecord::Base
  belongs_to :user
  has_many :subtasks
  accepts_nested_attributes_for :subtasks

  validates_presence_of :description

end
