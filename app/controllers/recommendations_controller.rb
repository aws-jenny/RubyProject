class RecommendationsController < ApplicationController
    def create
        puts params
        req_params = params[:format].split('_')

        recommendation_params = {
            :user_id => req_params[0],
            :certificate_id => req_params[1]
        }
    
        @recommendation = Recommendation.new(recommendation_params)
    
        if @recommendation.save
            flash[:success] = "Recommended successfully"
        else
            flash[:danger] = "Something went wrong"
        end
    
        redirect_to user_path(req_params[0])
    end
    
    def destroy
        req_params = params[:id].split('_')
        @recommendation = Recommendation.where(:user_id => req_params[0], :certificate_id => req_params[1])
        @recommendation.each do |recom|
            if recom.destroy
                flash[:success] = 'Unrecommended successfully.'
            else
                flash[:danger] = 'Something went wrong'
            end
        end
        redirect_to user_path(req_params[0])
    end
end
