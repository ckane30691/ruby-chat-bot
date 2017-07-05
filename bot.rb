require 'yaml'
require_relative './WordPlay/wordplay'

class Bot
  attr_reader :name

  def initialize(options)
    @name = options[:name] || "Unamed Bot"
    begin
      @data = YAML.load(File.open(options[:data_file]).read)
    rescue
      raise "Can't load bot data"
    end
  end

  def greeting
    random_response(:greeting)
  end

  def farewell
    random_response(:farewell)
  end

  def response_to(input)
    prepared_input = preprocess(input.downcase)
    sentence = best_sentence(prepared_input)
    reversed_sentence = WordPlay.switch_pronouns
    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end

  private

  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end

  def preprocess(input)
    perform_substitutions(input)
  end

  def perform_substitutions(input)
    @data[:presubs].each { |s| input.gsub!(s[0], s[1]) }
  end

  def best_sentence(input)
    hot_words = @data[:responses].keys.select do |k|
      k.class == String && k =~ /^\w+$/
    end
    WordPlay.best_sentence(input.sentences, hot_words)
  end

  def possible_responses(sentence)
    responses = []
    @data[:responses].keys.each do |pattern|
      next unless pattern.is_a?(String)
      if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
        if pattern.include?('*')
          response << @data[:responses][pattern].map do |phrase|
            matching_section = sentence.sub(/^.*#{pattern}\s+/)
            phrase.sub('*', WordPlay.switch_pronouns(matching_section))
          end
        else
          responses << @data[:responses][pattern]
        end
      end
    end
    responses << @data[:responses][:default] if responses.empty?
    responses.flatten
  end

end