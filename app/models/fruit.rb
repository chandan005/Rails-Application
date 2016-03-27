class Fruit < ActiveRecord::Base
	# Many to one association with plantation
  belongs_to :plantation

  # Validates presence of properties 
  validates_presence_of :name, length: {maximum: 50}
  validates_presence_of :variety, {maximum: 50}
  validates_presence_of :color, {maximum: 50}

  # Allowed to accept nested attributes of plantation
  accepts_nested_attributes_for :plantation

end
