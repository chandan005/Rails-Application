class FruitController < ApplicationController

	#Lists all the fruits
	def list()
		@fruits = Fruit.all
	end

	# Creates a new Fruit
	def new()
		@fruit = Fruit.new
		@plantations = Plantation.all
	end

	# Fetches fruit's properties
	def fruit_params()
		params.require(:fruit).permit(:name, :variety, :color, :plantation_id)
	end

	# Implements the new method and creates
	def create()
		@fruit = Fruit.new(fruit_params)

		if @fruit.save
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'new'
		end
	end

	# Gets id to edit
	def edit()
		@fruit = Fruit.find(params[:fruit_id]) || (params[:id])
		@plantations = Plantation.all
	end

	# Implements the edit method
	def update()
		@fruit = Fruit.find(params[:id])

		if @fruit.update_attributes(fruit_params())
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'edit'
		end
	end

	# Deletes the fruit
	def destroy()
		Fruit.find((params[:fruit_id]) || (params[:id])).destroy
		redirect_to :action => 'list'
	end


end
