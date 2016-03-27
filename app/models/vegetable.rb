class Vegetable < ActiveRecord::Base
	# Many ton one association with plantation
  belongs_to :plantation

  # Validates the presence and numericality of it's attributes
  validates_presence_of :name, {maximum: 50}
  validates_presence_of :variety, {maximum: 50}
  validates_presence_of :color, {maximum: 50}
  validates_numericality_of :time

  #Allowed to accept attributes from plantations
  accepts_nested_attributes_for :plantation
end
