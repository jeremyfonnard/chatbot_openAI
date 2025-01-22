require 'dotenv/load'
require 'http'

API_KEY = ENV['OPENAI_API_KEY']

if API_KEY.nil?
  puts "Erreur : clé API non définie dans le fichier .env"
  exit
end

require 'http'
require 'json'

class Chatbot
  API_URL = "https://api.openai.com/v1/completions"

  def initialize(prompt, model = "babbage-002")
    @prompt = prompt
    @model = model
  end

  def fetch_response
    response = HTTP.headers(
      "Authorization" => "Bearer #{API_KEY}",
      "Content-Type" => "application/json"
    ).post(
      API_URL,
      json: {
        model: @model,
        prompt: @prompt,
        max_tokens: 150
      }
    )

    if response.status.success?
      data = JSON.parse(response.body.to_s)
      data["choices"][0]["text"].strip
    else
      "Erreur : #{response.status} - #{response.body}"
    end
  end
end
