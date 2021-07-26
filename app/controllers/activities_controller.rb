class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = find_activity
        if activity
            activity.destroy
            head :no_content
        else
            render json: { error: "Activity not found" }
        end
    end

    private

    def find_activity
        Activity.find_by(id: params[:id])
    end
end
