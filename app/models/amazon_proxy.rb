class AmazonProxy
	Amazon::Ecs.configure do |options|
		options[:AWSAccessKeyId] = ENV["AWSAccessKeyId"]
		options[:AWSSecretKey] = ENV["AWSSecretKey"]
		options[:associate_tag] = ENV["associate_tag"]
	end	

	def self.save_book(asin, item)
		options                    = {}
	  image_url                  = item.get_hash('MediumImage')['URL']
	  item_attributes            = item.get_element('ItemAttributes')
	  options[:asin]             = asin
	  options[:title]            = item_attributes.get('Title')
	  options[:published_at]     = item_attributes.get('PublicationDate')
	  options[:author]           = item_attributes.get_array('Author').join(', ')
	  options[:amazon_image_url] = image_url
	  options[:image_url]        = save_image(asin, image_url)
	  Book.create! options
	end

	def self.import_book(asin)
		item = fetch(asin)
		save_book asin, item
	end

	def self.save_image(asin, image_url)
	  relative_path = "/static/#{asin}.jpg"
	  file_path     = Rails.root.join("public#{relative_path}")
	  Magick::Image.read(image_url).first.resize_to_fill(100, 100).write(file_path)
	  relative_path
	end

private
		def self.fetch(asin)
			result = Amazon::Ecs.item_lookup(asin, { :response_group => 'Medium' })
			result.items[0]
		end
end