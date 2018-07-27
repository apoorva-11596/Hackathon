class ImagesController < ApplicationController

  def uploadimage
  	upload_image = images_params
  	imgstr = Base64.encode64(File.read(upload_image.path))
  	response = RestClient.post 'http://4e9dc351.ngrok.io/api/upload', {"imageb64" => "#{imgstr}"}.to_json, {content_type: :json, accept: :json}
  	parsed_response = JSON.parse(response)
  	redirect_to action: "description" , location: parsed_response["location"], latitude: parsed_response["latitude"].to_i, longitude: parsed_response["longitude"].to_i
  end

  def searchHotels
  	 response = RestClient.post 'http://4e9dc351.ngrok.io/api/getDetails', {"location" => params[:location], "latitude" => params[:latitude].to_f, "longitude" => params[:longitude].to_f, "imageb64" => "dwefgrhtrgthy"}.to_json,{content_type: :json, accept: :json}
  	 parse_response = JSON.parse(response)
  	 
  	 parse_response.each do |res|
  		h = Hotel.new()
  	 	h.name = res["name"]
  	 	h.address = res["address"]
  	 	h.price = res["price"]
  	 	h.rating = res["rating"]
  	 	h.imageurl = res["imageUrl"]
      h.description = res["description"]
  	 	h.location = params["location"]

  	 	h.save
  	 end

     #byebug
  	 redirect_to action: "hotels" , location: params[:location]
  end

  def deleteHotels
  	
  	#byebug
  	@hotels = Hotel.where(location: params[:location])

  	@hotels.each do |hotel|
  		hotel.destroy
  	end

  	redirect_to '/images/index'
  end

  def index
  end

  def description
  		@location = params[:location]
  		@lat = params[:latitude]
  		@long = params[:longitude]
  end

  def hotels
  	#byebug
  	@location = params[:location]
  	@hotels = Hotel.where(location: params[:location])
  	#byebug
  end


  private

  def images_params
  	 params.require(:image)
  end
end
