class Admin::ProductsController < ApplicationController
	layout 'admin/admin'
	before_filter :authenticate_user

	def index
		@products = Admin::Product.all
		@model = Admin::Product.new
	end

	def show
		@product = Admin::Product.find_by_id(params[:id])	
	end

	def new
		@product = Admin::Product.new
		@action = 'create'
	end

	def create
		@action = 'create'
	    #@Product = Admin::Product.new(:name => params[:Product][:name],:catagory => params[:Product][:catagory], :flower => params[:Product][:flower])
	    @product = Admin::Product.new
	    
	    #### IMAGE UPLOAD START   ############
        upload = params[:product][:p_image]

        if upload
	        @time = Time.now.to_i
		    @strng_time = @time.to_s     
		    flower_name =   @strng_time.split(//).last(4).join("").to_s + upload.original_filename
		    directory = "app/assets/images/uploads/products"
		    # create the file path
		    path = File.join(directory, flower_name) 
		    @product.p_image = flower_name
		end
	    #### IMAGE UPLOAD BREAK ONE   ############	    
        @product.name = params[:product][:name]
        @product.height = params[:product][:height]
        @product.description = params[:product][:description]
        @product.price = params[:product][:price]
        @product.weight = params[:product][:weight]
        @product.stem = params[:product][:stem]
        @product.artist = params[:product][:artist]
        

	    if @product.save
	      #### IMAGE UPLOAD RESTART BREAK ONE   ############
	      # write the file
	      if upload
	      	File.open(path, "wb") { |f| f.write(upload.read) }
	      end	
	      #### IMAGE UPLOAD START END   ############     
	     
	      redirect_to products_path, :flash => { :alert => "Products Successfully Saved" }	      
	    else
	     flash[:notice] = "Product cannot save"
	     render 'new'
	    end
  end

	def edit
		@action = 'update'
		@product = Admin::Product.find(params[:id])
	end

	def update
		@action = 'update'	
		@old_Product = Admin::Product.find_by_id(params[:id])	
		@product = Admin::Product.find_by_id(params[:id])
		@p_image = @product.p_image
		#### IMAGE UPLOAD START   ############
        upload = params[:product][:p_image]
        if upload
	        @time = Time.now.to_i
		    @strng_time = @time.to_s     
		    flower_name =   @strng_time.split(//).last(4).join("").to_s + upload.original_filename
		    directory = "app/assets/images/uploads/products"
		    # create the file path
		    path = File.join(directory, flower_name) 
		    @product.p_image = flower_name
		end
	    #### IMAGE UPLOAD BREAK ONE   ############

		@product.name = params[:product][:name]
        @product.catagory = params[:product][:height]
        @product.description = params[:product][:description]
        @product.price = params[:product][:price]
        @product.weight = params[:product][:weight]
        @product.stem = params[:product][:stem]
        @product.artist = params[:product][:artist]
        #@obj = Admin::Product.update(@Product.id, :name => params[:Product][:name], :catagory => params[:Product][:catagory], :flower => @flower)
        if @product.save
        	if upload
	      		File.open(path, "wb") { |f| f.write(upload.read) }
	      	    #Delete the old one
	      		img_url = Rails.root.join('app', 'assets', 'images', 'uploads', 'products', @old_Product.p_image)
	      		if File.exist?(img_url)
                	File.delete(img_url) 
            	end
            	   


	        end
	        flash[:alert] = "Product Updated Successfully."
	        redirect_to(:controller => 'products', :action => 'index')
        else        
        	render 'edit'

        end
	end

	def delete	   
	   @content = Admin::Product.find(params[:id])
	   img_url = Rails.root.join('app', 'assets', 'images', 'uploads', 'products', @content.p_image)
	   if File.exist?(img_url)
          File.delete(img_url) 
       end
       @content.destroy
       flash[:alert] = "Product Deleted Successfully."
       redirect_to(:controller => 'products', :action => 'index')
	end

	def multiple_remove	   
	   if request.post?
	   	 @ids = params[:ids]

	   	 if @ids
	   	 	@ids.each do |id| 
	   	 		@prod = Admin::Product.find_by_id(id)
	   	 		img_url = Rails.root.join('app', 'assets', 'images', 'uploads', 'products', @prod.p_image)
				if File.exist?(img_url)
			        File.delete(img_url) 
			     end	   	 		
	   	 		@prod.destroy	   	 		
	   	    end
	   	    flash[:alert] = "Product Deleted Successfully."
	        redirect_to(:controller => 'products', :action => 'index')
	   	 else
	   	 	flash[:notice] = "Please choose a Product to delete."
	        redirect_to(:controller => 'products', :action => 'index')
	   	 end
	   else	   	  
	   	  redirect_to(:controller => 'products', :action => 'index')
	   end
	end

	private

	  def product_params
	    params.require(:product).permit(:catagory, :name, :p_image)
	  end

end
