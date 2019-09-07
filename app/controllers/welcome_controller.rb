class WelcomeController < ApplicationController
  def index
  	if params[:search].present?
      @poll = Poll.where("lower(title) LIKE :prefix OR lower(description) LIKE :prefix", prefix: "%#{params[:search].downcase}%")
    elsif params[:category_id].present?
      @cat = Category.find(params[:category_id])
      @polls = @cat.polls
    else
      @poll_votes = Poll.all
    end
      @categories = Category.all
  end

end
