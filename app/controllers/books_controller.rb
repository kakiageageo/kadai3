class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @book.user_id = current_user.id
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @boook = Book.new
    @user = @book.user
  end

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
       render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to "/books"
    end
  end
  
end

#<% if @book.errors.any? %>
 # <h3><%= @book.errors.count %>error prohibited this obj from being saved:</h3>
  #<ul>
   # <% @book.errors.full_messages.each do |message| %>
    #  <li><%= message %></li>
    #<% end %>
#  </ul>
#<% end %>