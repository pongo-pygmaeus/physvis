class Point3D
  attr_accessor :x, :y, :z

  def initialize(args = {})
    init_args(args)
  end

  def coordinates
    [x, y, z]
  end

private

  def init_args(args)
    if args[:coordinates]
      @x = args[:coordinates][0]
      @y = args[:coordinates][1]
      @z = args[:coordinates][2]
    else
      @x = args.fetch(:x, 0)
      @y = args.fetch(:y, 0)
      @z = args.fetch(:z, 0)
    end
  end
end