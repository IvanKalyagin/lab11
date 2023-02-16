class Lab11Controller < ApplicationController
  before_action :set_input, only: :show
  before_action :check_input, only: :show

  def input
    @counters = Palindrome.all
  end

  def show
    if @counter_in_db.nil?
      @counter.save
      @result = @counter.decode_output
      @message << 'Палиндромы добавлены в базу данных'
    else
      @result = @counter_in_db.decode_output
      @message << 'Палиндромы загружены из базы данных'
    end
  end

  def set_input
    @message = []
    @counter = Palindrome.new(input: params[:number])
    @counter_in_db = Palindrome.find_by(input: params[:number])
  end

  def check_input
    return if @counter.valid?
    redirect_to root_path, notice: @counter.errors.objects.map(&:message).first
  end
end
