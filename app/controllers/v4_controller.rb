require 'twitter'

class V4Controller < ApplicationController
  def home
  end
  def twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "jPMFoP5lTYFxnJQgrhejHVFnR"
      config.consumer_secret     = "bntUMRFIOpL0pnm6gjF3hqNNBypPUZfXn0kZ3wsM0cl5TtMDaU"
      config.access_token        = "883417707013472256-pGxa9RpFZVfQMDvWACbgE1LiOg8hJyT"
      config.access_token_secret = "dsC6U7v1TZd5HJnAAKTxLJzUNfDueHVM7eTnFQHo25p4i"
    end
    @tweets = client.search("to:YosemiteNPS snow", result_type: "recent").take(3).collect
  end
  def twilio
  end
end
