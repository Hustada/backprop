module ApplicationHelper
	require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def rouge_markdown(text)
    render_options = {
        filter_html: true,
        hard_wrap: true,
        link_attributes: { rel: 'nofollow' }
    }
    renderer = HTML.new(render_options)

    extensions = {
        autolink: true,
        fenced_code_blocks: true,
        lax_spacing: true,
        no_intra_emphasis: true,
        strikethrough: true,
        superscript: true
    }
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text)
  end
end


# class HTMLwithPygments < Redcarpet::Render::HTML
	# 	def block_code(code, language)
	# 		Pygments.highlight(code, lexer: language)
	# 	end
	# end
	# def markdown(content)
	#   renderer = HTMLwithPygments.new(:filter_html => true, :hard_wrap => true)
	#   options = {
	#   	:autolink => true,
	#     :fenced_code_blocks => true,
	#     :no_intra_emphasis => true,
	#     :disable_indented_code_blocks => true,
	#     :strikethrough => true,
	#     :lax_html_blocks => true,
	#     :superscript => true
	#   }
	#   Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	# end
