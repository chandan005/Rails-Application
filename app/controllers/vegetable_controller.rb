class VegetableController < ApplicationController

	# Action method to list all the vegetables
	def list()
		@vegetables = Vegetable.all
	end

	# Creates a new vegetable in the list
	def new()
		@vegetable = Vegetable.new
		@plantations = Plantation.all
	end

	# Takes in the properties of the vegetables as parameter
	def vegetables_params()
		params.require(:vegetable).permit(:name, :variety, :color, :time, :plantation_id)
	end

	# Implements the new method and creates
	def create()
		@vegetable = Vegetable.new(vegetables_params())

		if @vegetable.save
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'new'
		end
	end

	# Edits the vegetable 
	def edit()
		@vegetable = Vegetable.find(params[:vegetable_id]) || (params[:id])
		@plantations = Plantation.all
	end

	# Implemetns the edit method and updates
	def update()
		@vegetable = Vegetable.find(params[:id])

		if @vegetable.update_attributes(vegetables_params())
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'edit'
		end
	end

	# Deletes the vegetable
	def destroy()
		Vegetable.find((params[:vegetable_id]) || (params[:id])).destroy
		redirect_to :action => 'list'
	end

	
end
