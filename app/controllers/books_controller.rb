# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  # GET /books
  # GET /books.json
  def index
    @books = Book.where.not(title: "")
  end

  # GET /books/1
  # GET /books/1.json
  def show; end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
end
