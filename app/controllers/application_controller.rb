class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    private
		  def render_error(status, exception)
		    respond_to do |format|
		      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
		      format.all { render nothing: true, status: status }
		    end
	end
    
    
end