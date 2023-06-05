class LocationsController < ApplicationController

    def check 
        # Circle center coordinates
        circle_center_lat = 29.3814396
        circle_center_lon = 76.9591934

        # Circle radius in kilometers
        circle_radius = 1
        # Circle radius in meters
        circle_radius = 0.001

        # Point coordinates to check
        point_lat = params[:latitude].to_f
        point_lon = params[:longitude].to_f

        # Calculate the distance between the circle center and the given point
        distance = haversine_distance(circle_center_lat, circle_center_lon, point_lat, point_lon)

        # Check if the distance is less than or equal to the circle radius
        if distance <= circle_radius
            p "circle_radius : #{circle_radius*1000}"
            p "circle_radius : #{distance*1000}"
            puts "The point is within the circle."
        else
            p "circle_radius : #{circle_radius*1000}"
            p "distance : #{distance*1000}"
            puts "The point is outside the circle."
        end
    end

end
