class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all.order('created_at DESC')    #add pagination gem =>.paginate(page: params[:page],per_page: 3)
	end

private

	def article_params
		params.require(:article).permit(:title, :body)
	end
end
