class Pet # belongs to owner
  attr_accessor :name
  attr_reader :owner


  @@all = []

  def initialize(name)
    self.name = name
  end

  def save
    @@all << self
  end

  def introduction
    puts "Hi! My pet's name is #{self.name}!"
  end

  def owner=(owner)
    @owner = owner unless self.owner
    owner.add_pet(self) unless owner.pets.include?(self)
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
    @@all
  end
end