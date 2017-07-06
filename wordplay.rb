class String
  def sentences
    self.gsub(/\n|\r/, ' ').split(/\.\s*/)
  end

  def words
    self.scan(/\w[\w'\-]*/)
  end
end

class WordPlay
  PRONOUNS = {
    "i am" => "you are",
    "you are" => "i am",
    "i" => "you",
    "you" =>  "me",
    "me" => "you",
    "your" => "my",
    "my" => "your"
  }

  def self.switch_pronouns(text)
    text.gsub(/\b(#{ PRONOUNS.keys.join('|') })\b/i) do |pronoun| 
      PRONOUNS[pronoun.downcase]
    end.sub(/^me\b/i, 'i') 
  end

  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |sentence|
      sentence.words.length - (sentence.downcase.words - desired_words).length
    end
    ranked_sentences.last
  end

end