namespace :amazonbooksimport do
	desc 'Import books'
	task :import => :environment do
		start = Time.now
		puts 'Start'
		asins.each do |asin|
			puts "import #{asins}"
			AmazonProxy.import_book asin
		end
		puts "Complete in #{Time.now - start}s"
	end

	def asins
		%w(B00F4DZXU0)
	end
end