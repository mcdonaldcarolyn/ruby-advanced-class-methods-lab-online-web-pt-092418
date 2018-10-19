require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(stg)
    new_song = self.new
    new_song.name = stg
    new_song.save
    new_song
  end

  def self.find_by_name(stg)
    self.all.find {|obj| obj.name == stg }
  end

  def self.find_or_create_by_name(stg)
    find_by_name(stg) || create_by_name(stg)
  end
 
  def self.alphabetical 
     self.all.sort_by!{|obj| obj.name}
  end
 
  def self.new_from_filename(filename)
    new_array = filename.split(" - ")
    new_artist = new_array[0] 
    other_array = new_array[1].split(".")
    new_name = other_array[0]
    song = self.new
    song.artist_name = new_artist
    song.name = new_name
    song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
   self.all.clear
  end
end
