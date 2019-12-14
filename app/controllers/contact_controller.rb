class ContactController < ApplicationController

  # GET /contact
  # index page
  def index
  end

  # POST /contact
  # send email
  def send_request

    respond_to do |format|

      if contact_params[:message].blank? || contact_params[:cust_email].blank? || contact_params[:cust_name].blank?
        @contact_error = 'Make sure you have filled out all fields!'
        @contact_data = { message: contact_params[:message], cust_email: contact_params[:cust_email], cust_name: contact_params[:cust_name], error: @contact_error}
        format.html { render :index, contact_data: @contact_data, status: 422 }
        format.json { render json: @contact_error, status: 422 }
      end

      # ContactMailer.form_email(
      #   contact_params[:message], contact_params[:cust_name], contact_params[:cust_email]
      # ).deliver_later

      format.html { redirect_to home_url, notice: 'Successfully sent your support request.' }

    end

  end

  private
    # Filter accepted parameters
    def contact_params
      params.require(:contact).permit(:message, :cust_name, :cust_email)
    end
  
end
