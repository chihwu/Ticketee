class Project < ActiveRecord::Base
	has_many :tickets, dependent: :delete_all #delete the tickets belonging the ptoject when it is deleted
	
	validates :name, presence: true
end
