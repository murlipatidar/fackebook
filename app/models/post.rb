class Post < ApplicationRecord	
	belongs_to :user
    has_many :comments, dependent: :destroy 
	has_many :likes, dependent: :destroy
   	# has_many_attached :images
	has_one_attached :image

	validates :name, presence: true
	validates :image, presence: true


	def self.search(search)
	  Post.where("name LIKE ?", "%#{search}%") 
	  Post.joins(:comments).where('comments.Comment LIKE ?', "%#{search}%" )
	end

end

