require 'yaml'

bot_data = {
    :presubs   => [
      ["dont", "do not"],
      ["don't", "do not"],
      ["youre", "you're"],
      ["love", "like"],
      ["apologize", "are sorry"],
      ["dislike", "hate"],
      ["despise", "hate"],
      ["yeah", "yes"],
      ["mom", "family"]
      ],

    :responses => {
      :default           => [
                            "I don't understand.",
                            "What?",
                            "Huh?",
                            "Tell me about something else.",
                            "I'm tired of this. Change the subject."
                            ],
      :greeting          => [
                            "Hi. I'm [name]. Want to chat?",
                            "What's on your mind today?",
                            "Hi. What would you like to talk about?"
                            ],
      :farewell          => ["Good bye!", "Au revoir!"],
      'hello'            => [
                            "How's it going?", 
                            "How do you do?", 
                            "Enough with the pleasentries!"
                            ],
      'sorry'            => ["There's no need to apologize"],
      'different'        => [
                            "How is it different",
                            "What's changed?"
                            ],
      'everyone *'       => ["You think everyone *?"],
      'do not know'      => ["Are you always this indecisive?"],
      'yes'              => [
                            "At least your positive about something!",
                            "Great."
                            ],
      'family'           => ["Tell me about your family"],
      'you are *'        => [
                            "What makes you think I am *?",
                            "Are you sure that I'm *?"
                            ],
      'i am *'           => [
                            "Is it normal to be *?",
                            "Do you like being *?"
                            ],
      'i do not *'       => ["Why don't you *?"],
      'what'             => ["I don't know.", "Why?", "Why do you ask?"],
      'no'               => ["Really?", "Fair enough."],
      'why does *'       => [
                            "I don't know why *", 
                            "You already know the answer."
                            ],
      'why can\'t i *'   => ["Do you want to *?"],
      'why can\'t you *' => ["Do you want me to *?"],
      'hates *'          => ["Why do you think they hate *?"],
      'hate *'           => [
                            "Why don't you like *?", 
                            "Why the dislike of *?"
                            ],
      'i like *'         => [
                            "Why do you like *?",
                            "Wow I like * too!"
                            ]
    }
}

puts bot_data.to_yaml

f = File.open(ARGV.first || 'bot_data', "w")
f.puts bot_data.to_yaml
f.close