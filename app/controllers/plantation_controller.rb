class PlantationController < ApplicationController

	def list()
		@plantations = Plantation.all
	end

	def show()
		@plantation = Plantation.find(params[:id])
		@fruits = Plantation.joins(:fruits).select("fruits.name","fruits.variety","fruits.color","fruits.created_at","fruits.id").where(:id => @plantation)
		@vegetables = Plantation.joins(:vegetables).select("vegetables.name","vegetables.variety","vegetables.color","vegetables.created_at","vegetables.id","vegetables.time").where(:id => @plantation)
	end

	def new()
		@plantation = Plantation.new()
	end

	def plantation_params()
		params.require(:plantation).permit(:name, :location)
	end

	def create()
		@plantation = Plantation.new(plantation_params())

		if @plantation.save
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end

	def edit()
		@plantation = Plantation.find(params[:id])
	end

	


	def update()
		@plantation = Plantation.find(params[:id])

		if @plantation.update_attributes(plantation_params())
			redirect_to :action => 'list'
		else
			render :action => 'edit'
		end
	end


	def destroy()
		Plantation.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

end
