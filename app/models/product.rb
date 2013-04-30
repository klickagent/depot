class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates_presence_of :title, :description
  validates :price, :numericality => {:greater_than_or_equal_to => 0.05}
  validate :validate_title
 
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  
  
  
  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
  
  
  
  
  
	# validates own business rules
	protected
	def validate_title
	
	  return unless self.no_tests_allowed
	  errors.add(:fields, "title mustn't be test or title")
	end
	
	protected
	def no_tests_allowed
		if self.title.match(/.*test.*/i) || self.title.match(/.*title.*/i)
			return true
		else
			return false
		end
	end



end


