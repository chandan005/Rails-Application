class PlantationController < ApplicationController

	# Lists all the plantations
	def list()
		@plantations = Plantation.all
	end

	# Shows Plantations list and also lists the fruits and veggies
	def show()
		@plantation = Plantation.find(params[:id])
		@fruits = Plantation.joins(:fruits).select("fruits.name","fruits.variety","fruits.color","fruits.created_at","fruits.id").where(:id => @plantation)
		@vegetables = Plantation.joins(:vegetables).select("vegetables.name","vegetables.variety","vegetables.color","vegetables.created_at","vegetables.id","vegetables.time").where(:id => @plantation)
	end

	# Creates a new plantation
	def new()
		@plantation = Plantation.new()
	end

	# Fetches plantations properties
	def plantation_params()
		params.require(:plantation).permit(:name, :location)
	end

	# Implements the new method
	def create()
		@plantation = Plantation.new(plantation_params())

		if @plantation.save
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end

	# Gets the id of the plantations to be edited
	def edit()
		@plantation = Plantation.find(params[:id])
	end

	# Implements the edit method and updates
	def update()
		@plantation = Plantation.find(params[:id])

		if @plantation.update_attributes(plantation_params())
			redirect_to :action => 'list'
		else
			render :action => 'edit'
		end
	end

	# Deletes plantation
	def destroy()
		Plantation.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

end
