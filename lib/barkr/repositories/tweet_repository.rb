class TweetRepository < Hanami::Repository
  def all_by_sql
    tweets.read("SELECT * FROM users")
  end
end
