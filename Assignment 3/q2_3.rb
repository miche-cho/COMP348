=begin
Michelle Choi 26307647, modified Q1 for Q2 and Q3
READ file input and raising errors
=end

#This is the class Shape
class Shape
    def initialize
    end

    #the print method is the same accross all classes. It calls for the functions perimeter and area
    def print
        name = self.class.name
        per = perimeter
        ar = area
        puts "#{name}, perimeter: #{per}, area: #{ar}"
    end

    def perimeter
        "undefined"
    end

    def area
        "undefined"
    end
end

#This is the class Circle
class Circle < Shape
    attr_accessor :radius
    def initialize(rad =0)
        @radius = rad
    end

    def perimeter
        # raise exception if radius is not positive (Q2)
        if (@radius < 0)
            raise ArgumentError, 'Invalid Circle'
        else
            return Math::PI * 2 * @radius
        end
    end

    def area
        # raise exception if radius is not positive (Q2)
        if (@radius < 0)
            raise ArgumentError, 'Invalid Circle'
        else
            return Math::PI * @radius * @radius
        end
    end
end
#This is the class Rectangle
class Rectangle < Shape
    attr_accessor :height, :width
    def initialize(hei =0, wid =0)
        @height = hei
        @width = wid
    end

    def perimeter
        # raise exception if either height or width are not positive (Q2)
        if (@height < 0 || @width < 0)
            raise ArgumentError, 'Invalid Rectangle'
        else
            return 2 * @height + 2 * @width
        end
    end

    def area
        # raise exception if either height or width are not positive (Q2)
        if (@height < 0 || @width < 0)
            raise ArgumentError, 'Invalid Rectangle'
        else
            return @height * @width
        end
    end
end

#This is the class Ellipse
class Ellipse < Shape
    attr_accessor :a, :b
    def initialize(maj =0, min=0)
        #This is to verify that the greater value is put in the major variable
        if (maj > min)
            @a = maj
            @b = min
        else
            @a = min
            @b = maj
        end
    end
    
    #perimeter stays undefined

    def area
        # raise exception if either a or b are not positive (Q2)
        if (@a < 0 || @b < 0)
            raise ArgumentError, 'Invalid Ellipse'
            return 0
        else
        return @a * @b * Math::PI
        end
    end
    
    def eccentricity
        # raise exception if either a or b are not positive (Q2)
        if (@a < 0 || @b < 0)
            raise ArgumentError, 'Invalid Ellipse'
        else
            root = Math.sqrt(@a * @a - @b * @b) /@a
            return root
        end
    end
end

#instantiate counters for Q3
@numShapes = 0
@numRectangles = 0
@numCircles = 0
@numEllipses = 0

#Q2 read eachline from input.txt
puts"\n"
File.readlines('input.txt').each do |line|
    # for each line, split into array using space as delimiter
    element = line.split
    # creates new object instance where element is capitalized
    shape = Shape.const_get(element[0].capitalize).new
    
    # if the line (array) has one or more element 
    if element.length>0
        # since the head is the shape type, look at it to determine what to do 
        case element[0]
        
        # shape have undefined perimeter and area, only count
        when "shape"
            @numShapes+=1
        
        # rectange returns perimeter, area and count
        when "rectangle"
            h = shape.instance_variable_set(:@height, element[1].to_f)
            w = shape.instance_variable_set(:@width, element[2].to_f)
            # checks if both height an width are not negative (otherwise it's invalid and not counted) (Q3)
            if (h >= 0 && w >= 0)
                @numShapes+=1
                @numRectangles+=1
            end
        # circle returns perimeter, area and count
        when "circle"
            r = shape.instance_variable_set(:@radius, element[1].to_f)
            # checks if radius not negative (otherwise it's invalid and not counted) (Q3)
            if (r >= 0)
                @numShapes+=1
                @numCircles+=1
            end
        # ellipse has condition for checking whether invalid,
        # has undefined perimeter, area and count
        when "ellipse"
            a = shape.instance_variable_set(:@a, element[1].to_f)
            b = shape.instance_variable_set(:@b, element[2].to_f)
            # checks if both a an b are not negative (otherwise it's invalid and not counted) (Q3)
            if (a >= 0  && b >= 0)
                @numShapes+=1
                @numEllipses+=1
            end
        end
    end
    # at the end print all the shape instances neatly
    shape.print

    # if argument raised, rescue the exception and output the message (Q2)
    rescue ArgumentError => msg  
        # display the system generated error message  
        puts msg
end

# Q3 Statistics, keep count of the times instances were called in associative array
stats = { 
"Shape" => @numShapes,
"Rectange" => @numRectangles,
"Circle" => @numCircles,
"Ellipse" => @numEllipses
}

# print out statistics as string 
puts "\n"
puts "Statistics:"
stats.each_pair do |key, value|
    puts "   #{key}(s): #{value}"
end
