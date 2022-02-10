class GalleriesController < ApplicationController
    before_action :set_chef

    def create
        @gallery = @chef.galleries.build(gallery_params) 
        
        if @gallery.save
            flash[:notice] = "An image has been successfully uploaded"
            redirect_to chef_profile_path(@chef)
        else
            flash[:error] = 'Error encountered'
            @galleries = @chef.galleries.where.not(id: nil)
            render "chefs/profile"
        end
    end

    def edit
        @gallery = @chef.galleries.find(params[:id])
    end

    def update
        @gallery = @chef.galleries.find(params[:id])  

        if @gallery.update(gallery_params)
            redirect_to chef_path(@chef)
        else
            flash[:error] = 'Error encountered'
            render :edit
        end
    end

    def destroy
        @gallery = @chef.galleries.find(params[:id])

        @gallery.destroy
        redirect_to chef_profile_path(@chef), notice: "An image was successfully deleted"
    end

    private

    def set_chef
        @chef = Chef.find(params[:chef_id])
    end

    def gallery_params
        params.require(:gallery).permit(:image)
    end
end