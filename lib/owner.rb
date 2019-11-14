require 'pry'

class Owner
  
  attr_reader :name, :species 
  
  
  @@all = []
  
  
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end 
  
  
  def self.all 
    @@all 
  end 
  
  
  def cats 
     Cat.all.select do |c| 
       c.owner == self
     end 
  end 
  
  def dogs 
    Dog.all.select do |dog,owner| 
      dog.owner == self
    end 
  end 
  
  
  def say_species 
     "I am a #{@species}."
  end 
  
  def buy_dog(name)
     Dog.new(name,self)
  end 
  
  def self.buy_cat(name)
     Cat.new(name,owner)
  end 
  
  def walk_dog 
    Dog.mood = "happy" 
  end 
  
  def feed_cats 
    self.cats.each {|c| c.mood= "happy"}
  end 
  
  def sell_pets 
    self.dogs #iterate through 
    #self.reset_all 
    #Dog.mood = "nervous"
    #cat.mood = "nervous"
  end 
  
  def list_pets 
    Cat.all.select {|cat,owner| cat.owner == self}
    Dog.all.select {|dog,owner| dog.owner == self}  
  end 
  
  def self.count 
    @@all.size
  end 
  
  def self.reset_all 
    @@all.clear 
  end 
end