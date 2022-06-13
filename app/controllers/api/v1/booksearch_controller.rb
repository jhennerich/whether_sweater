class Api::V1::BooksearchController < ApplicationController
  before_action :check_params

  def index
    return if check_params
    books = OpenlibFacade.get_book_info(params[:location], params[:quantity])
    render json: BooksSerializer.new(books)
  end
end
