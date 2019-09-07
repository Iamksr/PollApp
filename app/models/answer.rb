class Answer < ApplicationRecord
	has_many :myoptions
	
	# belongs_to :poll, optional: true
end
