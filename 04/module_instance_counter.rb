module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@instances = 0
    def instances
      @@instances
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.@@instances += 1
      puts self.@@instances
    end
  end
end