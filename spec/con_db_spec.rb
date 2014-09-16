require "spec_helper"

describe Con_db do

  describe '#connect_sql' do
    it 'MySQL credentials' do
      expect(Con_db.new.connect_sql("root","root")).should_not be_nil
    end
  end
  describe '#db' do
    it 'query processing' do
      expect(Con_db.new.db("select * from category_tab")).should_not be_nil
    end
  end
  describe '#clear' do
    it 'clear tables' do
      expect(Con_db.new.clear()).should_not be_nil
    end
  end
end