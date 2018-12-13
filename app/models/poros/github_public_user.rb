
class GithubPublicUser

  def initialize(filter)
    @filter = filter
  end

  def login
    @filter[:login]
  end

  def url
    @filter[:html_url]
  end

  def user_id

  end

  def username
    @filter[:login]
  end

  def add_email(email)
    @email = email
  end

  def email
    @email 
  end


  def is_member
    member = Github.find_by_u_id( @filter[:id] )
    # !!member
  end

end
