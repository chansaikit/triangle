# Author Saikit Chan
# Complexity time: O(n)
# Algorithm: Greedy algorithm
# Starting from bottom to top
# compare the children and find which is bigger
# then add the bigger child to the parent
# do it on all parents

class Triangle
  
  
#calculate the maxium total
  def calculate(triArray)
    
    i = triArray.length() -1  
    
    #start from the bottom and loop all parents
    for counter in 0..triArray.length() -1

      for k in 0..i-1
        
        if triArray[i][k] > triArray[i][k+1]
          triArray[i-1][k] += triArray[i][k]
        else
          triArray[i-1][k] += triArray[i][k+1] 
        end 
      end
      i = i-1
    end

    #print out the head which is the maximum sum
    puts "The maximum total: #{triArray[0][0]}"  
    
    
  end
  
  
# Reading input file
# convert to 2d array
  def readFile(fname)
    counter = 1
    triArray = Array.new(100)
    
    file = File.new(fname, "r")
    while (line = file.gets)  
        a = line.split(' ').map{ |x| x.to_i }
        triArray[counter - 1] = a
        counter = counter + 1
    end
    file.close
    
    return triArray
  end
  
  
# Start here  
  object = Triangle.new()
  
  triArray = object.readFile("triangle.txt")
  
  #Test case
  #triArray = [[5],[9,6],[4,6,8],[0,7,1,5]]
  
  object.calculate(triArray)
  
end