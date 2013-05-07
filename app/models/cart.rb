class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.create(:product_id => product_id, :quantity => 1)
      #current_item.quantity = 1
      #current_item.attributes = {:quantity => 1}
    end
    current_item
  end
  
  def total_price
  	sum = 0
    line_items.each {|li| sum += li.total_price}
    sum
  end
end