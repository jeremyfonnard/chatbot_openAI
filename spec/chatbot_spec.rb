require_relative '../lib/chatbot'

RSpec.describe Chatbot do
  it "retourne une réponse valide pour une question simple" do
    chatbot = Chatbot.new("Quelle est la capitale de la France ?")
    response = chatbot.fetch_response
    expect(response).to be_a(String)
  end
end
