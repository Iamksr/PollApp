Rails.application.config.middleware.use OmniAuth::Builder do
   	provider :facebook, '786957165055049', '12ebc555fea01eac696b7bfb89a93df1'
	provider :linkedin, '81q662zzjusm67', 'xZyEHlGAaZI8Gm9q'
	provider :google_oauth2, '244615150400-05thnta81fhg631up71t8v7e167i8pta.apps.googleusercontent.com', 'XW9LFZYGtLjruVh9kOpmCaRY'
	#    provider :twitter, 'y6kILe3VwuGpaFIIfPXdnv8pw', 
	# 'Gb76xJS6ZvTrzzxp0jNFLnZG2nNhNaaNPfx5FAWLrL5y11e14D'
end