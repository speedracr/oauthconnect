Rails.application.config.middleware.use OmniAuth::Builder do
  provider :asana, '13424193641245', 'e0fe775d69e09c067d6df8f4f907f620'
 
  end