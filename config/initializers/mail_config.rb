
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    domain: 'gmail.com',
    port: 587,
    user_name: 'takuyaaaan23@gmail.com',
    password: 'njnvtzfwwvihgqus',
    authentication: 'plain',
    enable_starttls_auto: true
  }
