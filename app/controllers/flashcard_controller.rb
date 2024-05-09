class FlashcardController < ApplicationController
    def index
        if logged_in?
            @user = User.find_by(params[:id])
        end
    end
    
    def hang_dang_thuc
        if logged_in?
            @user = User.find_by(params[:id])
        end
    end
end
