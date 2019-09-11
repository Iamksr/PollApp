Rails.application.config.middleware.use OmniAuth::Builder do
   	provider :facebook, ENV['FACEBOOK_API_KEY'], ENV['FACEBOOK_API_SECRET']
	provider :linkedin, ENV['LINKEDIN_API_KEY'], ENV['LINKEDIN_API_SECRET']
	provider :google_oauth2, ENV['GOOGLE_API_KEY'], ENV['GOOGLE_API_SECRET']
	#    provider :twitter, 'y6kILe3VwuGpaFIIfPXdnv8pw', 
	# 'Gb76xJS6ZvTrzzxp0jNFLnZG2nNhNaaNPfx5FAWLrL5y11e14D'
end