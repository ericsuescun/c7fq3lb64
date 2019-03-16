class ExpensesController < ApplicationController

  before_action :authenticate_user!

  def index

    @userExpenses = Expense.where(["user_id = ?", current_user])

  	if (params[:concept] == '')
  		@expenses = @userExpenses.where(["category_id = ?", params[:category_id]])
  	end

  	if (params[:category_id] == '')
  		@expenses = @userExpenses.where('concept LIKE ?', "\%" + params[:concept].to_s + "\%" ).all
  	else
  		@expenses = @userExpenses.where(["category_id = ?", params[:category_id]])
  		@expenses = @expenses.where('concept LIKE ?', "\%" + params[:concept].to_s + "\%" )
  	end

  end
end
