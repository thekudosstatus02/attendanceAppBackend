class ApplicationController < ActionController::API
    SECRET = "secret_key"
  
    # def authentication
    #   # making a request to a secure route, token must be included in the headers
    #   decode_data = decode_user_data(request.headers["token"])
    #   puts decode_data.class
    #   if decode_data.class == NilClass 
    #       # result = Geocoder.search([29.3788834, 76.9549114]).first
    #       # address = result.address
    #       render json: { message: address }, status: :unauthorized
    #   else
    #       # getting user id from a nested JSON in an array.
    #       user_data = decode_data[0]["user_data"] 
    #       # find a user in the database to be sure token is for a real user
    #       user = User.find(user_data)
  
    #       # The barebone of this is to return true or false, as a middleware
    #       # its main purpose is to grant access or return an error to the user
  
    #       if user
    #         return true
    #       else
    #         render json: { message: "invalid credentials" }, status: :unauthorized
    #       end
    #   end  
  
    # end
  
    # turn user data (payload) to an encrypted string  [ A ]
    def encode_user_data(payload)
      token = JWT.encode payload, SECRET, "HS256"
      return token
    end
  
    # decode token and return user info, this returns an array, [payload and algorithms] [ A ]
    def decode_user_data(token)
      begin
        data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
        return data
      rescue => e
        puts e
      end
    end

    # Haversine formula to calculate the distance between two points on the Earth's surface
    def haversine_distance(lat1, lon1, lat2, lon2)
      radius = 6371  # Earth's radius in kilometers

      # Convert latitude and longitude to radians
      lat1_rad = Math::PI * lat1 / 180
      lon1_rad = Math::PI * lon1 / 180
      lat2_rad = Math::PI * lat2 / 180
      lon2_rad = Math::PI * lon2 / 180

      # Calculate the differences
      delta_lat = lat2_rad - lat1_rad
      delta_lon = lon2_rad - lon1_rad

      # Calculate the Haversine distance
      a = Math.sin(delta_lat / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(delta_lon / 2) ** 2
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      distance = radius * c

      distance
    end
  end
  