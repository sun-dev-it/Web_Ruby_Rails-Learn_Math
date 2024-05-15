class FlashcardsController < ApplicationController
  def index
    if logged_in?
        @user = User.find_by(params[:id])
        @flashcards = Flashcard.all
        @grouped_flashcards = @flashcards.group_by(&:title)
        @current_flashcard_index = params[:current_flashcard_index].to_i || 0
    end
  end

  def show
      @flashcard = Flashcard.find(params[:id])
  end

  def new
      @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)

    if @flashcard.save
      flash[:success] = "Flashcard đã được tạo thành công."
      redirect_to flashcard_path(@flashcard)
    else
      flash[:danger] = "Flashcard chưa có tiêu đề."
      render :new
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    @flashcard.destroy
    flash[:success] = "Đã xóa flashcard."
    #redirect_to flashcards_path
    redirect_to root_path
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:title, :kanji, :hiragana, :romaji, :meaning)
  end
end
