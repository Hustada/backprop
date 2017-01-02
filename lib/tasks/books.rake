<<<<<<< HEAD
namespace :books do
=======
namespace :booksamazonimport do
>>>>>>> master
	desc 'Import books'
	task :import => :environment do
		start = Time.now
		puts 'Start'
<<<<<<< HEAD
		asins.each do |asins|
			puts "import #{asin}"
=======
		asins.each do |asin|
			puts "import #{asins}"
>>>>>>> master
			AmazonProxy.import_book asin
		end
		puts "Complete in #{Time.now - start}s"
	end

	def asins
		%w(0670033847 0670882178 0465059996 0393239357)
	end
end