class ExamHistoriesController < ApplicationController

  def create
    @record = UserCertificateRecord.find(params[:user_certificate_record_id])

    @history = @record.exam_histories.create(exam_histories_params)

    if @history.valid?

      if @record.update(status: "Taken")
        flash[:notice] = "Set successfully."
      else
        flash[:alert] = "Something went wrong.Please try again."
      end
    else
        flash[:danger] = "Please fill-up both fields"
    end

    redirect_to certificate_path(@record.certificate_id)
  end
  
  private
    
  def exam_histories_params
      params.require(:exam_history).permit(:examinee_code, :exam_date, :user_certificate_record_id)
  end

end
