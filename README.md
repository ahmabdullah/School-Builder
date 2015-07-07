School Builder
==============

1.1 Requirements

School Builder Lite   has the following server requirmenets:

    A LAMP server (Linux/Unix + Apache + MySQL + PHP)
    Apache web server with mod_rewrite enabled
    PHP 5.1.6 or newer
    PHP MySQLi extension (regular MySQL might work but is not tested)

1.2 Installation

School Builder Lite   comes with an easy installation script, saving you from the trouble of having to everything manually.

After downloading your copy from CodeCanyon, you'll need to start by unpacking the ZIP file on your computer. Next, upload the everything inside the School Builder to your webserver. Once done, open your browser and navigate to the /install/ folder (for example, if you have uploaded the application to http://mydomain.com, you would need to open http://mydomain.com/install/ in your browser). This will bring up the installation script shown below:
School Builder picture

Here you'll need to fill in your MySQL database connection details and the email address and password you want to assign to the first admin account in your application (you will login with these details once the installation has been completed).

Things to check after installation
The first thing you should check are a couple of folder permissions. You'll need to make sure the following folders are writable by your webserver:

    /elements/images/uploads
    /tmp

The next thing you should verify is that there is a file named ".htaccess" located in your application's root folder. Since this file is hidden, you might need to force your file viewer to show hidden files.

