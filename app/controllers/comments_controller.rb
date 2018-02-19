class CommentsController < ApplicationController

	def new
		@article = Article.find(params[:article_id])
		@comment = Comment.new
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			respond_to do |format|
      	format.html { redirect_to article_path(@article)}
      end
		else
			flash[:notice] = "Something's wrong"
			redirect_to article_path(@article)
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end

end