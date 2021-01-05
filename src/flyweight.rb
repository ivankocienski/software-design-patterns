# Flyweight

class RouteModel
  attr_accessor :name

  def initialize(name = '')
    @name = name
  end
end

class VehiclePlanner
  def initialize(route_model)
    @route_model = route_model
  end

  def plan(parameter)
    puts "Planning for #{self.class} with #{@route_model.name} model. Value is #{parameter}"
  end
end

class CarPlanner < VehiclePlanner
end

class TruckPlanner < VehiclePlanner
  def plan(parameter)
    super parameter * 10
    puts '  (This planner augments the regular plan building process)'
  end
end

class MotorcyclePlanner < VehiclePlanner
end

# set up our expensive dataset first
route_model = RouteModel.new(:city_planner).freeze

# then set up a number of objects that can
# use that dataset
vehicle_planners = [
  CarPlanner.new(route_model),
  CarPlanner.new(route_model),
  TruckPlanner.new(route_model),
  MotorcyclePlanner.new(route_model)
]

# a 'simulation global' parameter that can be used (for example) to
#   alter the vehicle planning algorithm. E.g. a set
#   of roads that are closed for the day.
planning_parameter = 123

# now run the "simulation"
vehicle_planners.each do |planner|
  planner.plan planning_parameter
end
