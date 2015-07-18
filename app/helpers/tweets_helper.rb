module TweetsHelper

  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end
end
