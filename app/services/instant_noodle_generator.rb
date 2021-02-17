class InstantNoodleGenerator
  def initialize(miojo_time, hourglass1, hourglass2)
    @miojo_time = miojo_time.to_i
    @hourglass1 = hourglass1.to_i
    @hourglass2 = hourglass2.to_i
    @glass1 = 0
    @glass2 = 0
    @total_time = 0
  end

  def self.perform(miojo_time, hourglass1, hourglass2)
    new(miojo_time, hourglass1, hourglass2).perform
  end

  def perform
    if hourglasses_time_is_equal_miojo_time?
      return @miojo_time
    elsif hourglasses_time_is_minor_miojo_time?
      return 'Ampulhetas devem ter o tempo maior ou igual ao do miojo'
    end

    while ![@glass1, @glass2].include? @miojo_time do
      @glass1 = @hourglass1 if @glass1 == 0
      @glass2 = @hourglass2 if @glass2 == 0

      if @glass1 > @glass2
        @total_time += @glass2
        @glass1 -= @glass2
        @glass2 = 0
      elsif @glass2 > @glass1
        @total_time += @glass1
        @glass2 -= @glass1
        @glass1 = 0
      else
        return 'Não foi possível determinar o tempo de preparo do miojo pois as ampulhetas igualaram'
      end
    end

    @total_time + @miojo_time
  end

  private

  def hourglasses_time_is_equal_miojo_time?
    @hourglasses_time_is_equal_miojo_time ||= @hourglass1 == @miojo_time || @hourglass2 == @miojo_time
  end

  def hourglasses_time_is_minor_miojo_time?
    @hourglasses_time_is_minor_miojo_time ||= @hourglass1 < @miojo_time || @hourglass2 < @miojo_time
  end
end