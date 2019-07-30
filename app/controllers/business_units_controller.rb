class BusinessUnitsController < ApplicationController

	before_action :redirect_unless_admin

	def index
		@bus_units = BusinessUnit.all.order('name')

		@new_business_unit = BusinessUnit.new
	end

    def show
        @training = Training.find(params[:id])
    end
    
    # def new
    #     @business_unit = BusinessUnit.new
    # end
    
    def create
        @business_unit = BusinessUnit.new(bu_params)
		if @business_unit.save
			flash[:notice] = 'BU added.'
		else
			flash[:alert] = 'Saving failed.'
		end

		redirect_to business_units_path
    end

    def edit
    	@bus_units = BusinessUnit.all.order('name')
        @edit_business_unit = BusinessUnit.find(params[:id])

        render 'business_units/index'
    end
    
    def update
        @business_unit = BusinessUnit.find(params[:id])

        if @business_unit.update(bu_params)
  			flash[:success] = "BU updated."
  		else
  			flash[:alert] = "Update failed."
  		end
    	
    	redirect_to business_units_path
    end
    
    def destroy
        @business_unit = BusinessUnit.find(params[:id])

        if @business_unit.users.size != 0
        	flash[:alert] = "Cannot delete BU. There are users associated to it."
        else
        	if @business_unit.destroy
        		flash[:success] = "BU deleted."
        	else
        		flash[:alert] = "Something went wrong."
        	end
        end

        redirect_to business_units_path
    end
    
    
    private
    
    def bu_params
        params.require(:business_unit).permit(:name)
    end
end
