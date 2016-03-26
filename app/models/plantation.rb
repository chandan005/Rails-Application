class Plantation < ActiveRecord::Base
	has_many :fruits, :dependent => :destroy
	has_many :vegetables, :dependent => :destroy
	accepts_nested_attributes_for :fruits
	accepts_nested_attributes_for :vegetables



	validates_presence_of :name, length: {maximum: 50}, uniqueness: true, case_sensitive: false
	validates :location, presence: true
end
