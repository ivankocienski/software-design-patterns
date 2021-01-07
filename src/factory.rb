# Factory

# the not-so-simple class tree
class Engine
  attr_accessor :cylinder_count, :capacity

  def to_s
    "<engine cylinder_count=#{cylinder_count} capacity=#{capacity} />"
  end
end

class Wheels
  attr_accessor :trim, :width

  def to_s
    "<wheels trim=#{trim} width=#{width} />"
  end
end

class Steering
  attr_accessor :powered
  
  def to_s
    "<steering powered=#{powered}/>"
  end
end

class Car
  attr_accessor :make, :color
  attr_accessor :engine, :wheels, :steering

  def to_s
    <<-CAR
      <car make=#{make} color=#{color}>
        <components>
          #{engine}
          #{wheels}
          #{steering}
        </components>
    </car>
    CAR
  end
end

# the factory for building the complex class tree
#   from a well defined data structure.
module CarFactory
  DEFINITION_TABLE = {
    engine: :parse_engine_definition,
    wheels: :parse_wheel_definition,
    steering: :parse_steering_definition
  }

  extend self

  def construct_from(parameters)
    Car.new.tap do |car|
      car.make = parameters[:make]
      car.color = parameters[:color]

      parameters[:components].each do |component_parameters|
        parser = DEFINITION_TABLE[component_parameters[:type]]
        send(parser, car, component_parameters) if parser
      end
    end
  end

  private

  # fiddly construction logic tucked away in factory

  def parse_engine_definition(car, parameters)
    car.engine = Engine.new.tap do |engine|
      engine.cylinder_count = parameters[:num_cylinders]
      engine.capacity = parameters[:capacity]
    end
  end

  def parse_wheel_definition(car, parameters)
    car.wheels = Wheels.new.tap do |wheels|
      wheels.trim = parameters[:trim]
      wheels.width = parameters[:width]
    end
  end

  def parse_steering_definition(car, parameters)
    car.steering = Steering.new.tap do |steering|
      steering.powered = parameters[:powered]
    end
  end
end

# a complex data structure
car_definition = {
  make: 'ford',
  color: 'red',
  components: [
    { type: :engine, num_cylinders: 4, capacity: 2 },
    { type: :wheels, trim: false, width: 10 },
    { type: :steering, powered: true }
  ]
}

# our very simple API to build a Car
car = CarFactory.construct_from(car_definition)

puts car
