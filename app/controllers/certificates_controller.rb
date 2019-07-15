class CertificatesController < ApplicationController
  def index
    @certificates = Certificate.all
  end

  def show
    
    @certificate = Certificate.find(params[:id])
    @certificates = Certificate.where.not(id: @certificate)
    @status = "add"

    array_associate = []
    @certificate.associations.each_with_index do |associations, index|
      array_associate[index] = associations.associate
    end
    @available_certs = @certificates - array_associate

  end

  def new
    @certificate = Certificate.new
  end
  
  def edit
    @certificate = Certificate.find(params[:id])
  end

  def create
    @certificate = Certificate.new(certificates_params)
    if @certificate.save
      flash[:success] = 'Certificate successfully created'
      redirect_to certificates_path
    else
      # flash[:error] = 'Something went wrong'
      render 'new'
    end
  end
  
  def update
    @certificate = Certificate.find(params[:id])
      if @certificate.update(certificates_params)
        flash[:success] = 'Certificate was successfully updated'
        redirect_to certificates_path
      else
        # flash[:error] = 'Something went wrong'
        render 'edit'
      end
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    if @certificate.destroy
      flash[:success] = 'Certificate was successfully deleted.'
      redirect_to certificates_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to certificates_path
    end
  end
  

  private
  
  def certificates_params
    params.require(:certificate).permit(:name, :description, :exam_fee, :isReimbursable)
  end

end
