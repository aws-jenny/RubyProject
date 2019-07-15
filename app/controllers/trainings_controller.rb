class TrainingsController < ApplicationController

    before_action :redirect_unless_admin, except: [:show]

    def show
        @training = Training.find(params[:id])
    end
    
    def new
        @training = Training.new
    end
    
    def edit
        @training = Training.find(params[:id])

        @certificate = Certificate.find(@training.certificate_id)
        @status = "edit"
        puts @status

        # redirect_to certificate_path(@certificate)
        render 'certificates/show'
    end
    
    def create
        @certificate = Certificate.find(params[:certificate_id])

        @training = @certificate.trainings.create(trainings_params)

        if @training.valid?
            flash[:success] = "Added successfully"
        else
            flash[:danger] = "Please fill-up required fields"
        end
        redirect_to certificate_path(@certificate)
    end
    
    def update
        @certificate = Certificate.find(params[:certificate_id])

        @training = Training.find(params[:id])
        if @training.update(trainings_params)
            flash[:success] = 'Training was successfully updated'
            redirect_to certificate_path(@certificate)
        else
            # flash[:error] = 'Something went wrong'
            render 'edit'
        end
    end
    
    def destroy
        @certificate = Certificate.find(params[:certificate_id])

        @training = Training.find(params[:id])
        if @training.destroy
            flash[:success] = 'Training was successfully deleted.'
            redirect_to certificate_path(@certificate)
        else
            flash[:error] = 'Something went wrong'
            redirect_to certificates_path
        end
    end
    
    
    private
    
    def trainings_params
        params.require(:training).permit(:name, :description, :source, :certificate_id)
    end
      
end
