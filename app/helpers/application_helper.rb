module ApplicationHelper
	def markdown(content)
	  renderer = Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true)
	  options = {
	  	:autolink => true,
	    :fenced_code_blocks => true,
	    :no_intra_emphasis => true,
	    :disable_indented_code_blocks => true,
	    :autolink => true,
	    :strikethrough => true,
	    :lax_html_blocks => true,
	    :superscript => true
	  }
	  Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end
end
