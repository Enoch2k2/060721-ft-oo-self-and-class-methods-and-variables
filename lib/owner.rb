=begin
  In terms of ActiveRecord
  Owner.new - New means unsaved
  Owner.create - Create means saved
=end

class Owner
  attr_accessor :name # instance methods

  @@all = [] # class variable

  def initialize(name) # instance method
    self.name = name # writer method invocation
    # @name - instance variable
  end

  # new calls initialize on the instance it creates behind the scenes

  def save # instance method
    @@all << self # self refers to instance
  end

  def introduction # instance method
    puts "Hi! My name is #{self.name}!" # self refers to instance
  end

  def self.create(name) # class method
    owner = self.new(name) # self refers to class
    owner.save
    owner
  end

  def self.find_by_name(name) # class method
    self.all.find { |owner| owner.name == name}
  end

  def self.find_or_create_by_name(name) # class method
    if owner = self.find_by_name(name) # self refers to class
      owner
    else
      self.create(name)
    end
  end

  def self.all
    @@all # cass variable
  end
end