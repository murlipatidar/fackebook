AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

# puts 'Creating posts'

# 20.times do |i|
# 	Post.create(
# 		name: Faker::Name.name,
#  		image: Faker::LoremFlickr.image	
#  		# image: Faker::LoremFlickr.unique.image
#  		# image: Faker::Image.image
#  			)
# 	puts "Post #{i+1} has been created"
# end