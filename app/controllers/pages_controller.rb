class PagesController < ApplicationController

  def index
    if current_company
      redirect_to "/customer_requests"
    # elsif  current_customer
    #   redirect_to "/customers/#{current_customer.id}"
    else
      render "index.html.erb"
    end
  end

end
