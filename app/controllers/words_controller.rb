class WordsController < ApplicationController

  def create
    render json: { name: "dsfsfdsf" }
  end

  def show
    render json: { count: 44 }
  end

end