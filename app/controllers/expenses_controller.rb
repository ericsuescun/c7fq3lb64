class ExpensesController < ApplicationController
  def index

  	@expenses = Expense.all

  	if (params[:concept] == '')
  		@expenses = Expense.where(["category_id = ?", params[:category_id]])
  	end

  	if (params[:category_id] == '')
  		@expenses = Expense.where('concept LIKE ?', "\%" + params[:concept].to_s + "\%" ).all
  	else
  		@expenses = Expense.where(["category_id = ?", params[:category_id]])
  		@expenses = @expenses.where('concept LIKE ?', "\%" + params[:concept].to_s + "\%" )
  	end

  end
end
