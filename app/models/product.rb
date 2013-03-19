class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates_presence_of :title, :description
  validates :price, :numericality => {:greater_than_or_equal_to => 0.05}
  
  validate :validate_title
  
  
	# validates own business rules
	protected
	def validate_title
	  return unless self.no_tests_allowed
	  errors.add(:fields, "title mustn't be test")
	end
	
	protected
	def no_tests_allowed
		if self.title === "test"
			return true
		else
			return false
		end
	end

end


