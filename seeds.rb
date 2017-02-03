require_relative 'doppler'
require 'awesome_print'

altitude_degrees = 0
azimuth_degrees  = 0
degree_increments = 22.5
magnitude = 10
vectors = []

until altitude_degrees >= 360

  x = magnitude * Math.cos(Vector3D.degrees_to_radians(altitude_degrees))
  y = magnitude * Math.sin(Vector3D.degrees_to_radians(altitude_degrees))
  z = 0
  origin = Point3D.new(coordinates: [0,0,0])
  end_point  = Point3D.new(coordinates: [x,y,z])

  vectors << Vector3D.new(points: [origin, end_point])
  altitude_degrees += degree_increments
end

p vectors