class CustomerRequestsController < ApplicationController

  def index
    @requests = current_company.eligible_customer_requests
    render "index.html.erb"
  end

  def new
    @customer_request = CustomerRequest.new
    @categories = ServiceCategory.all
    render "new.html.erb"
  end

  def create
    @request = CustomerRequest.new(customer_request_params)
    @request.save
    flash[:success] = "You did it!"
    redirect_to '/customer_requests'
  end

  def show
    @request = CustomerRequest.find(params[:id])
    render "show.html.erb"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(
      :address,
      :city,
      :state,
      :zipcode,
      :description,
      :expires_date,
      :service_category_id
    )
  end
end
