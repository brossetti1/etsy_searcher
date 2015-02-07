class EtsyController < ApplicationController

#X-RateLimit-Limit: 10000
#X-RateLimit-Remaining: 9924


  def show
    @results = []
    if params[:search_query]
      resp = Etsy::Request.get('/listings/active',
                               :includes => ['Images', 'Shop'],
                               :keyword => params[:search_query],
                               :limit => 7) 
      @count = resp.total
      @results = resp.result
      #binding.pry
    end
    render :show
  end
end
 



#access = {:access_token => 'quw90fkvc91b93mx7aogmbc3',
#          :access_secret => 'uxjnrgb4d0'}



#Etsy.api_key = 'key'
#Etsy.api_secret = 'secret'
#user = Etsy.myself(token, secret)
#access = { :access_token => user.token, :access_secret => user.secret }
#Etsy::Listing.find_all_by_shop_  id(user.shop.id, access.merge(:limit => 5))

#The Heroku Way - easy way
#ETSY_API_TOKEN='quw90fkvc91b93mx7aogmbc3'
#`ETSY_API_TOKEN=ENV['ETSY_API_TOKEN']`

#complicated way
#YAML file - config/etsy.yaml
#Fill it with randome key_val: `etsy_token: aslknalksals`
#commit it, add to .gitignore
#Rails.configuration.etsy_token = YAML.load(Rails.root.join('config/etsy.yml'))
#add initializer file, etsy.rb, 

#ruby file in `cinfig/initializers`
#fill it with random key_val: `etsy_token: aslknalksals`
#gitignore the file
#fill it will your real API key
