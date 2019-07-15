class AssociationsController < ApplicationController
  def create
    assoc_params = params[:format].split('_')
    @certificate = Certificate.find(assoc_params[1])

    @association = @certificate.associations.build(:associate_id => assoc_params[0])
    if @association.save
      flash[:success] = "Association successfully created"
      redirect_to certificate_path(@certificate)
    else
      flash[:danger] = "Something went wrong"
      redirect_to certificate_path(@certificate)
    end
  end

  def destroy
    @association = Association.find(params[:id])
    if @association.destroy
        flash[:success] = 'Association was successfully deleted.'
        redirect_to certificate_path(@association.certificate_id)
    else
        flash[:error] = 'Something went wrong'
        redirect_to certificate_path(@association.certificate_id)
    end
  end
end
