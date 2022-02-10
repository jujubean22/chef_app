class ServicesController < ApplicationController
before_action :set_chef

def create
        @service = @chef.services.build(service_params) 
        
        if @service.save
            flash[:notice] = "Successfully created a service"
            redirect_to chef_profile_path(@chef)
        else
            flash[:error] = 'Error encountered'
            @services = @chef.services.where.not(id: nil)
            render "chefs/profile"
        end
    end

    def edit
        @service = @chef.services.find(params[:id])
    end

    def update
        @service = @chef.services.find(params[:id])  

        if @service.update(service_params)
            redirect_to chef_profile_path(@chef)
        else
            flash[:error] = 'Error encountered'
            render :edit
        end
    end

    def destroy
        @service = @chef.services.find(params[:id])

        @service.destroy
        redirect_to chef_profile_path(@chef), notice: "A service was succesfully deleted"
    end

    private

    def set_chef
        @chef = Chef.find(params[:chef_id])
    end

    def service_params
        params.require(:service).permit(:specialty, :service_rate)
    end
end
