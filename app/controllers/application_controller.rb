class ApplicationController < ActionController::Base
  def blank_square_form
  render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
  render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("minimum").to_f
    @upper = params.fetch("maximum").to_f
    @result = rand(@lower..@upper)
  render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def blank_sqrt
    render({ :template => "calculation_templates/sqrt_form.html.erb"})
  end

  def calculate_sqrt
    @inputnum = params.fetch("user_number").to_f
    @square_root = Math.sqrt(@inputnum)
  render({ :template => "calculation_templates/sqrt_results.html.erb"})
  end

  def blank_pmt
    render({ :template => "calculation_templates/pmt_form.html.erb"})
  end

  def calculate_pmt
    @aprnum = params.fetch("user_apr").to_f
    @yearsnum = params.fetch("user_years").to_f
    @principalnum = params.fetch("user_pv").to_f
    @pmt_num = @principalnum * @yearsnum * @aprnum
    @ratepermonth = @aprnum / 12 / 100
    @denominator = 1-(1+@ratepermonth)**(-12*5)
    @monthlypmtresult = @ratepermonth*@principalnum/@denominator
  render({ :template => "calculation_templates/pmt_results.html.erb"})
  end

end
