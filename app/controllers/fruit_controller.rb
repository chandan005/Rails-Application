class FruitController < ApplicationController

	def list()
		@fruits = Fruit.all
	end

	def show()
		@fruit = Fruit.find(params[:id])
	end

	def new()
		@fruit = Fruit.new
		@plantations = Plantation.all
	end

	def fruit_params()
		params.require(:fruit).permit(:name, :variety, :color, :plantation_id)
	end

	def create()
		@fruit = Fruit.new(fruit_params)

		if @fruit.save
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'new'
		end
	end

	def edit()
		@fruit = Fruit.find(params[:fruit_id]) || (params[:id])
		@plantations = Plantation.all
	end



	def update()
		@fruit = Fruit.find(params[:id])

		if @fruit.update_attributes(fruit_params())
			redirect_to :action => 'list'
		else
			@plantations = Plantation.all
			render :action => 'edit'
		end
	end

	def destroy()
		Fruit.find((params[:fruit_id]) || (params[:id])).destroy
		redirect_to :action => 'list'
	end

	def show_plantations()
		@plantation = Plantation.find(params[:id])
	end

end
