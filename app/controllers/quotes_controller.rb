class QuotesController < ApplicationController

  def new
    @customer_request_id = params[:customer_request_id]
    @quote = Quote.new
    render 'new.html.erb'
  end

  def create
    Quote.create(quote_params)
    if @quote.save
      QuoteMailer.email_quote(@customer).deliver_now
      redirect_to '/customer_requests'
    else
      render 'new'
    end
  end

  private

  def quote_params
    params.require(:quote).permit(
      :customer_request_id,
      :materials_cost_estimate,
      :labor_cost_estimate,
      :start_date,
      :completion_date_estimate,
      :notes
    ).merge(company_id: current_company.id)
  end
end
# maybe this is how you do it see when the person gets to the new quote form, the quote instance is populated with it. There's a bunch of ways to do this. You could store the id in the session and retrieve it as well.