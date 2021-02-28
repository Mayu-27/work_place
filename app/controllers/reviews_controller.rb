class ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review
  end

  def show

  end
end
