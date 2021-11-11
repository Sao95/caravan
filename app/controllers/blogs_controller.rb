class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id) #次に表示したいページにリダイレクト
    else
      render :new #falseならば、新規投稿ページを再表示
    end
  end

  def edit
    @blog = Blog.find(params[:id]) #findメソッド:Blogモデルのデータベースから投稿データを探す
  end
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end
  
  def destroy
    blog = Blog.find(params[:id]) #投稿データを取得する
    blog.destroy #投稿データを削除する
    redirect_to blogs_path #一覧ページへリダイレクトさせる
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
  
end
