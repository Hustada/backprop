class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :article
	validates :body, presence: true

	auto_html_for :body do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end