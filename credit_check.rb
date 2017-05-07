class CreditCheck

  attr_reader :card_number

  attr_accessor :card_numbers,
                :doubled_card_nums,
                :nums_over_10_sum,
                :summed

  def initialize(card_number)
    @card_number = card_number
    @valid = false
    @card_numbers = card_numbers
    @doubled_card_nums = doubled_card_nums
    @nums_over_10_sum = nums_over_10_sum
    @summed = summed
  end

  def validate
    string_to_array
    double_every_other
    sum_double_digits
    sum_all_digits
    valid?
  end

  def string_to_array
    card_numbers_array = @card_number.split("")
    @card_numbers = card_numbers_array.map do |num|
      num.to_i
    end
  end

  def double_every_other
    @doubled_card_nums = @card_numbers.map.with_index do |num, index|
      if index.even?
        num * 2
      else
        num
      end
    end
  end

  def sum_double_digits
    @nums_over_10_sum = @doubled_card_nums.map do |num|
      if num.digits.count > 1
        num.digits.sum
      else
        num
      end
    end
  end

  def sum_all_digits
    @summed = @nums_over_10_sum.sum
  end

  def valid?
    if @summed % 10 == 0
      @valid == true
      puts "The number is good."
    else
      puts "The number is no good."
    end
  end

end


card_number = CreditCheck.new("4832890564887362")
card_number.validate

card_number_2 = CreditCheck.new("5541801923795240")
card_number_2.validate

card_number_3 = CreditCheck.new("4024007136512380")
card_number_3.validate
