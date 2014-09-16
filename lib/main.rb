require 'io/console'
load "application.rb"
load "category.rb"
load "apps.rb"
load "checkurl.rb"
load "con_db.rb"

STDOUT.sync = true

class Main

  cURL = CheckURL.new
  cat_Obj = Category.new
  app_Obj = Application.new
  app_de_Obj = Apps.new
  db_con_obj = Con_db.new
  
  print "Enter URL : "
  base_url = gets.chomp
  base_url.insert(0,"http://") unless base_url.include? "http://"
  unless cURL.isURL(base_url)
  	puts "Check URL or internet connection "
  	exit
  end

  puts "\nMySQL Credentials."
  print "User name?: "
  u_name = gets.chomp
  print "Password?: "
  passwd = STDIN.noecho(&:gets).chomp
  puts "  "
  db_con_obj.connect_sql(u_name,passwd)
  db_con_obj.clear()

  #base_url = "http://www.1mobile.com"
  cat_names = cat_Obj.getCat(base_url)
  cat_links = cat_Obj.get_c_link(base_url)
  cat_index = 0

  puts "\n<< RIPPING >>"

  cat_links.each do | links |

    puts "\n  #{cat_index + 1}. " + cat_names[cat_index] 
    #feeding category_tab
    db_con_obj.db("INSERT INTO category_tab VALUES ('','#{cat_names[cat_index]}')");
    
    app_names = app_Obj.getApp(links)
    app_links = app_Obj.get_l_links(base_url, links)
    app_dlinks = app_Obj.get_d_links(base_url, links)


    app_index = 0
    app_links.each do | alink |

      puts "    #{app_index + 1}. " + app_names[app_index]

      app_name_tmp = app_names[app_index]
      app_name_tmp.to_s.gsub!("'","")

      app_desc = app_de_Obj.getDesc(alink)
      app_desc_tmp = app_desc[0]
      app_desc_tmp.to_s.gsub!("'","")

      #getting cat_id for application_tab
      app_id_rec =  db_con_obj.db("select * from category_tab where name = '#{cat_names[cat_index]}'")
      app_id_rec.each(:cache_rows => false) do |record| 
        $catg_id = record['cat_id']
      end
      #feeding application_tab
      db_con_obj.db("insert into application_tab values ('','#{app_name_tmp}','#{app_desc_tmp}','#{app_dlinks[app_index]}','#{$catg_id}')")

      #getting app_id for screenshots_tab
      img_id_rec =  db_con_obj.db("select * from application_tab where name = '#{app_name_tmp}'")
      img_id_rec.each do |record|
        $appl_id = record['app_id']
      end
      #feeding screenshots_tab
      app_screens = app_de_Obj.getPics(alink)
      app_screens.each do |img_link|
        db_con_obj.db("INSERT INTO screenshots_tab VALUES ('','#{img_link}','#{$appl_id}')")
      end
      app_index += 1
      break if app_index == 5
    end
    cat_index += 1
  end
  puts "\n<< RIPPING COMPLETED >>"
end
