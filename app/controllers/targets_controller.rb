class TargetsController < ApplicationController
	def index

		# if Date.today.month >= 4
		# 	@current_fiscal_year = Date.today.year
		# elsif Date.today.month < 4
		# 	@current_fiscal_year = Date.today.year - 1
		# end

		@current_fiscal_year = CURRENT_FISCAL_YEAR

		@selected_fy = @current_fiscal_year
		if params.has_key?(:selected_fy)
			@selected_fy = params[:selected_fy]
		end

		@target_certifications = Target.joins(:certificate).where(fiscal_year: @selected_fy)
	end

	def new
		@target = Target.new
	end

	def create
		@target = Target.new(target_params)

		if @target.save
			flash[:notice] = 'Target added.'
			redirect_to targets_path(:selected_fy => params[:target][:fiscal_year])
		else
			flash[:alert] = 'Saving failed.'
			render 'new'
		end
	end

	def edit
		@target = Target.find(params[:id])
	end

	def update
		@target = Target.find(params[:id])
		if @target.update(target_params)
			flash[:notice] = "Target updated."
			puts params[:fiscal_year]
			redirect_to targets_path(:selected_fy => params[:target][:fiscal_year])
		else
			flash[:alert] = 'Update failed.'
			render 'edit'
		end
	end

	def destroy
		@target = Target.find(params[:id])
		if @target.destroy
			flash[:success] = "Target deleted."
		else
			flash[:alert] = "Deletion failed."
		end

		redirect_to targets_path(:selected_fy => @target.fiscal_year)
	end

	private
	def target_params
		params.require(:target).permit(:fiscal_year, :certificate_id, :target_passers)
	end
end
