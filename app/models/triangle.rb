class Triangle

  attr_reader :triangle, :total, :max_values, :max_indexes
  
  def initialize(triangle)
    validate_triangle triangle
    @triangle = triangle
  end
  
  def process
    @triangle.each_index do |row|
      process_row(row)
    end
  end


  protected 
  def process_row(row)
    max_index =
        case
          when row == 0 then 0
          else extract_max_index(row)
        end
    store_max_index(row, max_index)
    store_max_value(row, max_index)
    sum_max_value(row, max_index)
  end

  def extract_max_index(row)
    previous_row_index = @max_indexes[row - 1]
    (@triangle[row][previous_row_index] > @triangle[row][previous_row_index + 1]) ? previous_row_index : previous_row_index + 1
  end

  def store_max_index(row, max_index)
    @max_indexes ||= []
    @max_indexes[row] = max_index
  end

  def store_max_value(row, max_index)
    @max_values ||= []
    @max_values << @triangle[row][max_index]
  end

  def sum_max_value(row, max_index)
    @total ||= 0
    @total += @triangle[row][max_index]
  end


  private
  def validate_triangle(triangle)
    valid = triangle.instance_of? Array
    raise TriangleError.new "Expected an array of arrays." unless valid

    triangle.each_index {|row| validate_row(triangle, row) }
  end

  def validate_row(triangle, row)
    valid = triangle[row].instance_of? Array
    raise TriangleError.new "Row[#{row}] Expected an array." unless valid

    # First row should have 1 index. Second row should have 2 index... (successively)
    valid = (row + 1 == triangle[row].size)
    raise TriangleError.new "Row[#{row}] Expected that the array contains #{row + 1} indexes." unless valid

    # Values ​​must be integers
    valid = triangle[row].all?(&:integer?) rescue false
    raise TriangleError.new "Row[#{row}] Expected that the array contains all integer values." unless valid
  end

end
