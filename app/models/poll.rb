class Poll < ApplicationRecord
	has_many :myoptions, dependent: :destroy
	has_many :answers, dependent: :destroy
  belongs_to :category
	accepts_nested_attributes_for :answers, :allow_destroy => true
	
end
