class TargetsController < ApplicationController
	def index

	end

	def new
		@target = Target.new
	end

	def create
		@target = Target.new(target_params)

		if @target.save
			flash[:notice] = 'Target added.'
			redirect_to targets_path
		else
			flash[:alert] = 'Saving failed.'
			render 'new'
		end
	end

	private
	def target_params
		params.require(:target).permit(:fiscal_year, :certificate_id, :target_passers)		
	end
end
