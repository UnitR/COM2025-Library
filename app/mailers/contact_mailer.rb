class ContactMailer < ApplicationMailer
    default to: 'ap01249@surrey.ac.uk',
          from: 'best_books@surrey.ac.uk'
    layout 'mailer'
  
    # The support email account
    @@target_email = 'ap01249@surrey.ac.uk'
  
    def form_email(message, cust_name, cust_email)
      @message = message
      @user_name = cust_name
      @user_email = cust_email
      mail(subject: 'Support request')
    end  
end
