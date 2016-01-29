class Stacker
  attr_accessor :s

  def initialize(eps=nil)
    # domino displacements - s[i] is the displacement
    # of the ith domino from the top from the one above it
    @s = [0.0]
    @l = [0.0]
    @eps = eps || 0.0000001
    @d_rel_memo = {}
  end
  
  def s= s
    @s = s
  end

  def add_dmno
    i = @s.size
    
    # Position the existing stack with its CoM eps away from the edge
    d = 1 - @eps - @l[i-1]
    if d <= @eps
      # CoM of dmnos i-1 and above is at or beyond the edge of dmno i
      # It will not be stable if shifted, so don't place another dmno
      raise Exception.new("The possible displacent is now less than eps (#{@eps}). You could lower eps and try again")
    end
      
    @s[i] = d
    @l[i] = c_mass(i)
  end
  
  # Center of mass of the dmno substack consisting of dmnos 0..i
  # with the origin taken as dmno i
  def c_mass i
    l = disp_total(i) / (i+1)
  end
  
  # displacement of dmno i from dmno j, where j>i
  def d_rel i, j
    if i >= j
      raise Exception.new("i must be less than j")
    end
    
    d_top(j) - d_top(i)
  end
  
  # displacement of dmno i from the top dmno
  def d_top i
    d = @s[0..i].reduce do |a,b|
      a + b
    end
    d || 0.0
  end
  
  private
  
  # Sum of displacements of the i top dmnos from its base (dmno i)
  def disp_total i
    subset = (0..i-1).to_a
    subset.inject(0.0) do |memo, j|
      memo + d_rel(j, i)
    end
  end
end
