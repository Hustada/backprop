module ArticlesHelper

	def embed(video_url)
  	youtube_id = video_url.split("=").last
  	content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
	end

	def video_id(video_url)
		youtube_id = video_url.split("=").last
	end

#Gets a random image in case no image has been uploaded
	def get_random_image
    image_path_prefix = "app/assets/images/"
    image_files = Dir.glob("#{image_path_prefix}random-images/*")
    image_files.sample.split(image_path_prefix)[1]
  end
	
end
