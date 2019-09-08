class WordsLogic

  def self.count_words(text)
    tokenizer_options = { punctuation: :none, numbers: :none }
    tokenizer = PragmaticTokenizer::Tokenizer.new(tokenizer_options)
    words = tokenizer.tokenize(text)

    downcased = words.map(&:downcase)
    downcased.each do |name|
      word = Word.where(name: name).first
      if word.nil?
        word = Word.create!(name: name)
      end
      word.increase_count
    end
  end

  def self.count_words_for_large_file(file)
    # streaming instead of reading to memory the whole file in order handle large files
    File.open(file.path).each_line do |line|
      self.count_words(line)
    end
  end

  def self.count_words_for_url(url)
    response = HTTParty.get(url)
    raise "invalid URL" unless resposne.success?
    text = ActionView::Base.full_sanitizer.sanitize(response.body)
    count_words(text)
  end

end