class Article < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
	validates :body,  presence: true
	has_attached_file :image, styles: { large: "600X600#", medium: "300X300>", thumb: "150X150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_attached_file :header, styles: { large: "900X900#", medium: "300X300>", thumb: "150X150#"}
																		 # :convert_options => { :large => "-quality 92" }
	validates_attachment_content_type :header, content_type: /\Aimage\/.*\z/
	# belongs_to :user
end