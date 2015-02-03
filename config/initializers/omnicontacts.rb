require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "65614944493-easruahv838srbpcolqr2m1ng2et89b3.apps.googleusercontent.com", "6dIXLC0Lij2Uqdymsm7XHG9v", {:redirect_path => "/oauth2callback",:max_results => 2000000}#, :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
  # importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  importer :hotmail, "0000000040138E05", "lnRrIGPkT2nckR5ATjLqSy5ZpZQ-EHEB"
  # importer :facebook, "client_id", "client_secret"
end