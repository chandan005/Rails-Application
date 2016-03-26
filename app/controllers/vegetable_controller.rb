class VegetableController < ApplicationController

	def list()
		@vegetables = Vegetable.all
	end

	def show()
		@vegetable = Vegetable.find(params[:id])
	end

	def new()
		@vegetable = Vegetable.new
		@plantations = Plantation.all
	end

	def vegetables_params()
		params.require(:vegetable).permit(:name, :variety, :color, :time, :plantation_id)
	end

	def create()
		@vegetable = Vegetable.new(vegetables_params())

		if @vegetable.save
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'new'
		end
	end

	def edit()
		@vegetable = Vegetable.find(params[:vegetable_id]) || (params[:id])
		@plantations = Plantation.all
	end

	def update()
		@vegetable = Vegetable.find(params[:id])

		if @vegetable.update_attributes(vegetables_params())
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'edit'
		end
	end

	def destroy()
		Vegetable.find((params[:vegetable_id]) || (params[:id])).destroy
		redirect_to :action => 'list'
	end

	

	
end
