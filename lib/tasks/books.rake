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
		%w(B06XNKV5TS, B01M0LNE8C, B01HY3TC54, B01MRVFGX4, B00YSILNL0, B00845UQL6)
	end
end