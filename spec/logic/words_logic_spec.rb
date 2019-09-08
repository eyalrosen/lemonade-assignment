require 'rails_helper'

describe WordsLogic do

  before {
    @text = <<-EOS
      The path of the righteous man is beset on all sides by the iniquities
      of the selfish and the tyranny of evil men. Blessed is he who, in the name
      of charity and good will, shepherds the weak through the valley of the darkness.
      For he is truly his brother's keeper and the finder of lost children.
      And I will strike down upon thee with great vengeance and furious anger those
      who attempt to poison and destroy my brothers.
      And you will know I am the Lord when I lay my vengeance upon you.
    EOS
  }

  context '#count_words_for_large_file' do

    before {
      file = Tempfile.new
      file << File.read("#{Rails.root}/fixtures/text.txt")
      WordsLogic.count_words_for_large_file(file)
    }

    it { expect(Word.first.name).to eq('it') }

  end

  context '#count_words' do

    before {
      WordsLogic.count_words(text)
    }

    it { expect(Word.first.name).to eq('the') }

    it { expect(Word.first.count).to be(5) }

  end

end