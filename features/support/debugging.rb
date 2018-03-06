#Before do |login scenario|
    #write steps for login feature
 #   Any time you run this feature will execute first and then followed by rest of the feature



After do |scenario|
    
    
  save_and_open_page if scenario.failed? 
  #sreenshot shot code is placed here
end