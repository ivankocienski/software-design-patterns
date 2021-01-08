# Observer

class VisitCounter
  def initialize
    @count = 0
  end

  def notify
    @count += 1
  end

  def report
    "has had #{@count} visits"
  end
end

class Doctor # the subject
  def initialize
    @observers = {}
  end
  
  def subscribe(event_name, observer)
    @observers[event_name] ||= []
    @observers[event_name] << observer
  end

  def checkup
    puts 'Doctor checkup'
    notify_subscribers :checkup
  end

  private

  def notify_subscribers(event)
    observer_list = @observers[event]
    return if observer_list.nil?

    observer_list.each do |observer|
      observer.notify
    end
  end
end

#
# demonstration
#

# the observing object
visit_counter = VisitCounter.new

# the object being observed
doctor = Doctor.new
doctor.subscribe :checkup, visit_counter

# doing some work with the doctor
doctor.checkup
doctor.checkup
doctor.checkup

# the observer has its own data to report on
puts "visit counter report: #{visit_counter.report}"
