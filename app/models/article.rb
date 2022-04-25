class Article < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
	validates :body,  presence: true
	has_one_attached :image
	has_one_attached :header
	# validates_attachment_content_type :header, content_type: /\Aimage\/.*\z/
	belongs_to :user, optional: true
	has_many :comments
	acts_as_taggable_on :tags

	@@video_regexp = [ /^(?:https?:\/\/)?(?:www\.)?youtube\.com(?:\/v\/|\/watch\?v=)([A-Za-z0-9_-]{11})/, 
                   /^(?:https?:\/\/)?(?:www\.)?youtu\.be\/([A-Za-z0-9_-]{11})/,
                   /^(?:https?:\/\/)?(?:www\.)?youtube\.com\/user\/[^\/]+\/?#(?:[^\/]+\/){1,4}([A-Za-z0-9_-]{11})/
                   ]


	def video_id
  	@@video_regexp.each { |m| return m.match(video_url)[1] unless m.nil? }
	end


	def previous_article
		Article.where(["id < ?", id]).last
	end

	def next_article
		Article.where(["id > ?", id]).first
	end

end