class Project < ActiveRecord::Base
	belongs_to :skill

	validates :name, :presence => true
	  mount_uploader :picture, PictureUploader
end