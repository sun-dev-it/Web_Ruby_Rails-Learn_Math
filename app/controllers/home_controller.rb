class HomeController < ApplicationController
    def index
        if logged_in?
          @user = User.find_by(params[:id])
          @flashcards = Flashcard.all
          @grouped_flashcards = @flashcards.group_by(&:title)
          @selected_title = params[:selected_title]
        end
    end
end
