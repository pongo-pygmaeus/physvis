require_relative 'spec_helper'

describe Point3D do

  describe 'initializes with an array' do
    let(:point) { Point3D.new( coordinates: [1,2,3] ) }
    
    it 'has three coordinates' do
      expect(point.coordinates.length).to eq 3
    end
    it 'has valid coordinate array values' do
      expect(point.coordinates[0]).to eq 1
      expect(point.coordinates[1]).to eq 2
      expect(point.coordinates[2]).to eq 3
    end 
    it 'has a valid x value' do
      expect(point.x).to eq 1
    end
    it 'has a valid y value' do
      expect(point.y).to eq 2
    end
    it 'has a valid z value' do
      expect(point.z).to eq 3
    end
  end

  describe 'initializes with separate coordinates' do
    let(:point) { Point3D.new( x: 4, y: 5, z: 6 ) }
    it 'has three coordinates' do
      expect(point.coordinates.length).to eq 3
    end
    it 'has valid coordinate array values' do
      expect(point.coordinates[0]).to eq 4
      expect(point.coordinates[1]).to eq 5
      expect(point.coordinates[2]).to eq 6
    end    
    it 'has a valid x value' do
      expect(point.x).to eq 4
    end
    it 'has a valid y value' do
      expect(point.y).to eq 5
    end
    it 'has a valid z value' do
      expect(point.z).to eq 6
    end
  end

end

describe Vector3D do

  describe 'initializes with two points' do
    let(:zero_point) { Point3D.new( coordinates: [ 0,0,0 ] ) }

    let(:points) { [ Point3D.new( coordinates: [ 5,5,0 ] ),
                     Point3D.new( coordinates: [-5,5,0 ] ),
                     Point3D.new( coordinates: [ 0,2,0 ] ),
                     Point3D.new( coordinates: [ 0,3,0 ] ),
                     Point3D.new( coordinates: [ 1,1,0 ] ), 
                     Point3D.new( coordinates: [ 10,10,0 ] ) ] }

    let(:vectors)    { [ Vector3D.new( points: [ points[0], points[1] ] ),
                         Vector3D.new( points: [ points[2], points[3] ] ),
                         Vector3D.new( points: [ points[4], points[5] ] ) ] }

    it 'has two points' do
      expect(vectors[0].points.length).to eq 2
      expect(vectors[1].points.length).to eq 2
    end
    it 'has valid points sets' do
      expect(vectors[0].points[0].x).to eq 5
      expect(vectors[0].points[0].y).to eq 5
      expect(vectors[0].points[0].z).to eq 0

      expect(vectors[0].points[1].x).to eq -5
      expect(vectors[0].points[1].y).to eq 5
      expect(vectors[0].points[1].z).to eq 0

      expect(vectors[1].points[0].x).to eq 0 
      expect(vectors[1].points[0].y).to eq 2
      expect(vectors[1].points[0].z).to eq 0

      expect(vectors[1].points[1].x).to eq 0
      expect(vectors[1].points[1].y).to eq 3
      expect(vectors[1].points[1].z).to eq 0
    end
    it 'has a valid origin_point' do    
      expect(vectors[0].origin_point.x).to eq 5
      expect(vectors[0].origin_point.y).to eq 5
      expect(vectors[0].origin_point.z).to eq 0
    end
    it 'has a valid end_point' do
      expect(vectors[0].end_point.x).to eq -5
      expect(vectors[0].end_point.y).to eq 5
      expect(vectors[0].end_point.z).to eq 0
    end
    it 'has a valid horizontal magnitude' do
      expect(vectors[0].magnitude).to eq 10.0
    end
    it 'has a valid vertical magnsitude' do
      expect(vectors[1].magnitude).to eq 1.0
    end
    it 'has a valid angled magnitude' do
      expect(vectors[2].magnitude).to be_within(0.001).of(12.727922061357855)
    end
    it 'has a valid horizontal altitude in degrees' do
      expect(vectors[0].altitude).to eq 90.0
    end
    it 'has a valid vertical altitude in degrees' do
      expect(vectors[1].altitude).to eq 0.0
    end
    it 'has a valid angled altitude in degrees' do
      expect(vectors[2].altitude).to eq 45.0
    end
  end
end


