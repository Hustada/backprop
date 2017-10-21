class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = current_user.articles.create(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
		@user = User.find_by(params[:user_id])
		set_meta_tags :og => {
                  :title    => "#{@article.title}",
                  :description => "#{@article.body}",
                  :type     => "Blog article",
                  :url      => "#{article_url(@article)}",
                  :image    => "#{@article.image.url}",
                  :video    => "#{@article.video_url}"
                  }
	end

	def index
		@user = current_user
		@articles = Article.all.order('created_at DESC').paginate(page: params[:page],per_page: 1)
		@popular_articles = Article.all.order('created_at DESC').paginate(page: params[:page],per_page: 4)
		@recent_article = Article.order("created_at").last
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(params[:article].permit(:title, :body, :image, :header, :video_url))
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to root_path
	end

	def truncation
		@articles = Article.all.truncate(40)
	end


private

	def article_params
		params.require(:article).permit(:title, :body, :image, :header, :video_url)
	end
end
