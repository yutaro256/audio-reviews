class ToppagesController < ApplicationController
  def top
    @reviews = Review.all.limit(3).order(created_at: :desc)
  end
end
