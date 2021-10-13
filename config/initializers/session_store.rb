if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_crime-reporter-2', domain: 'crime-reporter-2-json-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_crime-reporter-2'
end 