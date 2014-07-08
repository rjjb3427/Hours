namespace "stats" do
  desc "Shows an overview of the existing accounts"
  task :accounts do
    puts "      Account       |    Users    |    Entries    | Last Entry"
    puts "----------------------------------------------------------------------------"
    Account.all.map(&:subdomain).each do |account|
      Apartment::Database.switch(account)
      puts "%-18s  | %5s users | %5s entries | %s" % [account, User.count, Entry.count, Entry.last.created_at]
    end
  end
end
