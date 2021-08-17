class Pet
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end

  def introduction
    puts "Hi! My pet's name is #{self.name}!"
  end

  def self.all
    @@all
  end
end