class BooksController < ApplicationController
  before_action :authorize_admin, :except => ["index", "show"]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    render :layout => false
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.build_book_detail
  end

  # GET /books/1/edit
  def edit
    render :layout => false
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.created_at = Time.now.utc
    @book.updated_at = Time.now.utc

    if not @book.in_series
      @book.seq_in_series = 0;
    end

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, status: 303 }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:author_name, :book_name, :in_series, :seq_in_series, :synopsis, book_detail_attributes: [:edition, :isbn])
    end

end
