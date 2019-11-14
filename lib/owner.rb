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
    Dog.all.select do |d| 
      d.owner == self
    end 
  end 
  
  
  def say_species 
     "I am a #{@species}."
  end 
  
  def buy_dog(name)
     Dog.new(name,self)
  end 
  
  def buy_cat(name)
     Cat.new(name,self)
  end 
  
  def walk_dogs 
    self.dogs.each {|d| d.mood= "happy"} 
  end 
  
  def feed_cats 
    self.cats.each {|c| c.mood= "happy"}
  end 
  
  def sell_pets 
    self.dogs.each {|d| d.mood = "nervous"}
    self.cats.each {|c| c.mood = "nervous"}
    self.dogs.each {|d| d.owner = nil}
    self.cats.each {|c| c.owner = nil} 
    #self.reset_all 
    #Dog.mood = "nervous"
    #cat.mood = "nervous"
  end 
  
  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  
  def self.count 
    @@all.size
  end 
  
  def self.reset_all 
    @@all.clear 
  end 
end