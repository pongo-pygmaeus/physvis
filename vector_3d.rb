require_relative 'point_3d'

class Vector3D
  attr_accessor :points, 
                :speed, 
                :direction,
                :origin_point,
                :end_point

  def initialize(args = {})
    init_args(args)
  end

  def add(vector)
    p1 = Point3D.new( coordinates: 
                    [ self.points[0].x + vector.points[0].x,
                      self.points[0].y + vector.points[0].y,
                      self.points[0].z + vector.points[0].z ] )

    p2 = Point3D.new( coordinates: 
                    [ self.points[1].x + vector.points[1].x,
                      self.points[1].y + vector.points[1].y,
                      self.points[1].z + vector.points[1].z ] )


    return Vector3D.new( points: [ p1, p2 ] )
  end

  def magnitude
    @magnitude ||= calculate_magnitude
  end

  def direction
  end

  def altitude
    @altitude ||= calculate_altitude
  end

  def azimuth
    @azimuth ||= calculate_azimuth
  end

  def end_point
    @end_point ||= calculate_end_point
  end

  def magnitude_relative_to(vector)
    
  end

  def altitude_relative_to(vector)
    
  end

  def azimuth_relative_to(vector)
    
  end

  alias_method  :+, :add

  def self.degrees_to_radians(degrees)
    degrees * Math::PI / 180 
  end

private
  
  def calculate_magnitude
    x_length = @origin_point.x - @end_point.x
    y_length = @origin_point.y - @end_point.y
    z_length = @origin_point.z - @end_point.z

    Math.sqrt( x_length**2 + y_length**2 + z_length**2 )
  end

  def calculate_altitude
    
  end

  def calculate_azimuth
    
  end

  def calculate_end_point
    
  end

  def init_args(args)
    if args[:speed] || args[:altitude]
      @points = args.fetch( :points, [ Point3D.new,
                                       Point3D.new ] )
      @origin_point = @points[0]
      @end_point    = @points[1]

    else
      @points = args.fetch( :points, [ Point3D.new,
                                       Point3D.new ] )
      @origin_point = @points[0]
      @end_point    = @points[1]
    end
  end
end