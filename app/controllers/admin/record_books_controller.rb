class Admin::RecordBooksController < ApplicationController
     layout'admin' 
  def index
    @record_books = RecordBook.all
  end

  def show
    @record_book = RecordBook.find(params[:id])
  end

  def new
    @record_book = RecordBook.new
  end

  def create
    @record_book = RecordBook.new(params[:record_book])
    if @record_book.save
      redirect_to @record_book, :notice => "Successfully created admin/record book."
    else
      render :action => 'new'
    end
  end

  def edit
    @record_book = RecordBook.find(params[:id])
  end

  def update
    @record_book = RecordBook.find(params[:id])
    if @record_book.update_attributes(params[:record_book])
      redirect_to @record_book, :notice  => "Successfully updated admin/record book."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @record_book = RecordBook.find(params[:id])
    @record_book.destroy
    redirect_to admin_record_books_url, :notice => "Successfully destroyed admin/record book."
  end
end
