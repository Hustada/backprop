class AmazonProxy
	Amazon::Ecs.configure do |options|
		options[:AWS_access_key_id] = ''
		options[:AWS_secret_key] = ''
		options[:associate_tag] = ''
	end	

private
		def self.fetch(asin)
			result = Amazon::Ecs.item_lookup(asin, { :response_group => 'Medium' })
			result.items[0]
		end
end