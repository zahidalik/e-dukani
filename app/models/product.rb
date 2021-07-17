class Product < ApplicationRecord
  validates :item_name, presence: true
  validates :pieces, presence: true
  validates :price, presence: true
  validates :description, presence: true
  
  has_rich_text :description
  has_many_attached :images

  def self.sms_alert
    require 'net/http'
    require 'json'

    api_key = Rails.application.credentials.beem[:api_key]
    secret_key = Rails.application.credentials.beem[:secret_key]
    source_addr = localhost:3000
    body = {
      'source_addr': source_addr,
      'schedule_time': '',
      'encoding': '0',
      'message': 'SMS Test from Ruby API.',
      'recipients': [
      {
      'recipient_id': 1,
      'dest_addr': '255655719784', # this will change with the mobile number of the user
      },
      ],
      }
    uri = URI('https://apisms.beem.africa/v1/send')
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json', 'Authorization' => 'Basic ' + api_key + ':' + secret_key)
    req.body = {body}.to_json
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end
end
