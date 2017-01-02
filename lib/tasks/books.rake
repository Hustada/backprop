namespace :booksamazonimport do
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
		%w(0670033847 0670882178 0465059996 0393239357)
	end
end