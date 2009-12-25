##############  commands #################

run "curl -L http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js > public/javascripts/jquery.js"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run %{find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}
file '.gitignore', <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END
run "rm README"

run "rm public/index.html"

run "rm public/favicon.ico"

run "rm public/robots.txt"
