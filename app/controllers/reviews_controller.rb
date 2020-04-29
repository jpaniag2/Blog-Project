class ReviewsController < ApplicationController
    def create
    @article = Article.find(params[:article_id])
    @review = @article.reviews.create(review_params)
    redirect_to article_path(@article)
    end
    
    
    def destroy
    @article = Article.find(params[:article_id])
    @review = @article.reviews.find(params[:id])
    @review.destroy
    redirect_to article_path(@article)
    end
    
    
    private 
        def review_params
            params.require(:review).permit(:commenter, :body, :rating)
        end
        
        
end
