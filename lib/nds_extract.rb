# Provided, don't edit
require "pp"
require 'directors_database'
require "pry"

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point



def movies_with_director_key(name,movies_collection)
  new_arr = []
    movies_collection.each do |movie|
      movie[:director_name] = name
      new_arr.push(movie)
    end
  new_arr
end

 # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method. 
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method

def gross_per_studio(collection)
 results = {}
    row_index = 0 
    total = 0
        while row_index < collection.length do 
                    if  results[collection[row_index][:studio]]
                    results[collection[row_index][:studio]] += collection[row_index][:worldwide_gross]
                  else 
                    results[collection[row_index][:studio]] = collection[row_index][:worldwide_gross]
                  end
            row_index += 1
        end
    results
end

#movies_with_director_key(name,movies_collection)

def movies_with_directors_set(source)
  source.map do |n|
    movies_with_director_key(n[:name],n[:movies])
    end
end 

# [{:name=>"Byron Poodle", :movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
# {:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]


 # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end