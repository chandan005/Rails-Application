class Plantation < ActiveRecord::Base
	# One to many plantations with fruit and vegetables
	# Also has the power to delete it's many associations
	has_many :fruits, :dependent => :destroy
	has_many :vegetables, :dependent => :destroy

	# Allowed to accept attributes for fruits and vegetables
	accepts_nested_attributes_for :fruits
	accepts_nested_attributes_for :vegetables


	# Validates the presence of it's properties
	validates_presence_of :name, length: {maximum: 50}, uniqueness: true, case_sensitive: false
	validates :location, presence: true
end
