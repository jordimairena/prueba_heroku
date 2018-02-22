class ArticlesController < ApplicationController
	#GET /articles
	def index
		@articles =	Article.all 
	end
	#Get /articles/:id
	def show 
		@articles = Article.find(params[:id])
	end
	#Get /article/new
	def new
		@articles =Article.new		
	end
	#POST /articles
	def create
		@articles =Article.new(article_params)
		if @articles.save
		redirect_to @articles
		else
		render :new
		end
	end

	def edit
		@articles = Article.find(params[:id])
	end

	def destroy
	@articles = Article.find(params[:id])
	@articles.destroy
	redirect_to articles_path
	end

	def update
		#@articles.update_attributes({title: 'Nuevo titulo'})
		@articles = Article.find(params[:id])
		if @articles.update(article_params)
			redirect_to @articles
		else
			render :edit
		end	
	end

	private
	def article_params
				params.require(:article).permit(:title, :body) 
		
	end

end