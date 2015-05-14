Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, " IvSPgRHaCCuHiMKxOwrliQs33", "gFjKXnfqciYSsEU935BCzOEaLH0mCaYf6CGjorE4hFrIACpguT"
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
end