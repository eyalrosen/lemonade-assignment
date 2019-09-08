class WordsController < ApplicationController

  def create
    params.require(:input_type)

    case params[:input_type]
    when 'plain'
      params.require(:text)
      WordsLogic.count_words(params[:text])

    when 'file'
      # using stub instead of POST file uploading so you won't have to waste your time
      file = Tempfile.new
      file << File.read("#{Rails.root}/fixtures/text.txt")
      WordsLogic.count_words_for_large_file(file)

    when 'url'
      params.require(:url)
      WordsLogic.count_words_for_url(params[:url])

    end
    render json: { success: true }
  end

  def show
    params.require(:word)
    word = Word.where(name: params[:word].downcase).first
    render json: { count: word.count }
  end

end