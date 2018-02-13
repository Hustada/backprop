module ApplicationHelper
	class HTMLwithPygments < Redcarpet::Render::HTML
		def block_code(code, language)
			Pygments.highlight(code, lexer: language)
		end
	end
	def markdown(content)
	  renderer = HTMLwithPygments.new(:filter_html => true, :hard_wrap => true)
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
