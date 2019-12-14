# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def form_email
        ContactMailer.form_email('Hello World', 'Angel Peltekov', 'ap01249@surrey.ac.uk')
    end
end
