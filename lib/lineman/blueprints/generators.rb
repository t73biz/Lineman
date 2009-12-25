############## generate commands #################
generate("nifty_layout --haml")
generate("nifty_layout admin --haml")
generate("nifty_config")
generate("nifty_scaffold post name:string content:text")
generate("rspec")