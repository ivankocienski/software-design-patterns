# Composite

# Leaf class
class Widget
  def initialize(name)
    @name = name
  end

  def render(indent=0)
    puts "#{' ' * indent}Widget#render: name=#{@name}"
  end
end

# Group class
class Container
  def initialize(children)
    @children = children
  end

  def render(indent=0)
    puts "#{' ' * indent}Container#render"
    @children.each do |child|
      child.render indent + 2
    end
  end
end

#
# demonstration
#

sub_sub_widgets = [
  Widget.new('epsilon'),
  Widget.new('foxtrot')
]

sub_widgets = [ 
  Widget.new('cappa'),
  Container.new(sub_sub_widgets),
  Widget.new('delta')
]

widgets = [
  Widget.new('alpha'),
  Widget.new('beta'),
  Container.new(sub_widgets)
]

# iterate over composites 
widgets.each do |element|
  element.render
end

