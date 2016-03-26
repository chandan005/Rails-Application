class Vegetable < ActiveRecord::Base
  belongs_to :plantation

  validates_presence_of :name, {maximum: 50}
  validates_presence_of :variety, {maximum: 50}
  validates_presence_of :color, {maximum: 50}
  validates_numericality_of :time
  accepts_nested_attributes_for :plantation
end
