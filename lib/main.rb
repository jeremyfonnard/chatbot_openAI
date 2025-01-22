require_relative 'lib/chatbot'

puts "Bienvenue dans le Chatbot OpenAI !"
puts "Que voulez-vous demander ?"
user_input = gets.chomp

chatbot = Chatbot.new(user_input)
puts "Réponse du chatbot : #{chatbot.fetch_response}"
