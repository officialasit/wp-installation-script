# Wordpress Installation Script

This is a script that will help you to install the latest wordpress on a linux machine / server.

## Installation Steps

1. Clone this Repository
```
git clone https://github.com/officialasit/wp-installation-sript.git
```

2. Run the Script
```
./install.sh
```

3. Setup the Database
```
sudo mysql -uroot
> CREATE DATABASE wordpress;
> quit
```

4. Open the IP of server / localhost in browser. Add the database details and you are good to go.


Credits: Inspiration taken from https://gist.github.com/NathanTheGr8/7ff8c57eb2d6f528295699f93f014091
