class BooksController < ApplicationController
  def index
  	@books = Book.order(:last_sales_rank).paginate(page: params[:page], per_page: 5)
  end
end
