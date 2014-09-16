require "mysql2"

class Con_db
  attr_accessor :con
  def connect_sql(u_name,passwd)
    $con = Mysql2::Client.new(:host =>"localhost", :username =>u_name, :password =>passwd, :database =>"1mobile_db")
  end

  def db(strq)
  	$con.query(strq)
   rescue Mysql2::Error => e
    puts e.error
  end

  def clear()
  	$con.query("delete from screenshots_tab")
  	$con.query("delete from application_tab")
  	$con.query("delete from category_tab")
    $con.query("alter table screenshots_tab auto_increment=1")
    $con.query("alter table application_tab auto_increment=1")
    $con.query("alter table category_tab auto_increment=1")
   rescue Mysql2::Error => e
    puts e.error
  end
end
