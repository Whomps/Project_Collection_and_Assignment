#module NavigationHelpers
#  def path_to(page_name)
#    case page_name
 
   
 #   when /^User_Details$/ then '/users/1'
#    when /the home\s?page/
#      '/users/1'
#    when /login_page/
#      '/login'
#    when /Users/
#      '/users'
#    else
      #begin
      #  page_name =~ /the (.*) page/
      #  path_components = $1.split(/\s+/)
      #  self.send(path_components.push('path').join('_').to_sym)
      #rescue Object => e
      #  raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
      #    "Now, go and add a mapping in #{__FILE__}"
 #     #end
#    end
#  end
#end

#World(NavigationHelpers)

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /home_page/ 
      '/'
    #when /^home\s?page/
    #   '/'
    when /login_page/
      '/login'
    
    when /login_netid_page/
      '/login_netid'
    when /login_page/
      '/login'
    when /^forgot_password_page/
      '/password_resets/new'
    when /^password_reset_page/
      '/password_resets/new'
    when /^projects/ then '/projects'
   
    when /signup_page/ then '/signup'
      
    when /user_details/ then '/users/1'
      
    when /jointeam_page/ then '/jointeam'
    
    when /createteam_page/ then '/teams/new'
      
    when /approved_projects/ then '/approved_projects'
      
    when /addproposal/ then '/add_project'
      
    when /myproposal/ then '/myproposals_projects'
      
    when /assignedpro/ then '/projects/'
      
    when /pest/ then '/peer_evaluation'
    
    when /update_details/ then '/users/1/edit'
      
    when /myteam/ then '/teams'
      
    
    
#    when /^the edit page for "(.*)"$/
#	edit_movie_path Movie.find_by_title($1)

#    when /^the details page for "(.*)"$/
	#movie_path Movie.find_by_title($1)

#    when /^the Similar Movies page for "(.*)"$/
#	same_director_path Movie.find_by_title($1)

#    when /^the RottenPotatoes home page$/ then '/movies'

#    when /^the (RottenPotatoes)?home\s?page$/ then '/movies'

#    when /^the movies page$/ then '/movies'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)