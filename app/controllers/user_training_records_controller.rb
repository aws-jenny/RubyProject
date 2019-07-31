class UserTrainingRecordsController < ApplicationController
  def create
    req_params = params[:format].split('_')

    utr_params = {
      :isDone => false,
      :user_id => current_user.id,
      :training_id => req_params[0]
    }

    @utr = UserTrainingRecord.new(utr_params)

    @utr.training.certificate.user_certificate_records.each do |ucr|
      if ucr.user_id == current_user.id
        if ucr.status == 'Wished'
          if !ucr.update(status: 'Ongoing')
            flash[:danger] = "Something went wrong"

            redirect_to certificate_path(req_params[1])
          end
        end
      end
    end

    if @utr.save
        flash[:success] = "Training started"
    else
        flash[:danger] = "Something went wrong"
    end

    redirect_to certificate_path(req_params[1])
  end
  

  def update
    req_params = params[:id].split('_')

    @utr = UserTrainingRecord.find(req_params[0])

    @utr.isDone = true

    if @utr.save
        flash[:success] = "Updated successfully"
    else
        flash[:danger] = "Something went wrong"
    end

    redirect_to certificate_path(req_params[1])
  end

  def destroy
    req_params = params[:id].split('_')
    @utr = UserTrainingRecord.find(req_params[0])
    if @utr.destroy
      flash[:success] = 'Removed successfully.'
      redirect_to certificate_path(req_params[1])
    else
      flash[:danger] = 'Something went wrong'
      redirect_to certificate_path(req_params[1])
    end
  end
  
end
