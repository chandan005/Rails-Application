class Fruit < ActiveRecord::Base
  belongs_to :plantation


  validates_presence_of :name, length: {maximum: 50}
  validates_presence_of :variety, {maximum: 50}
  validates_presence_of :color, {maximum: 50}
  accepts_nested_attributes_for :plantation

end
