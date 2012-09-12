Open Source E-Commerce Development Environment
=====================

This config makes it easy to start with OXID CE or Magento CE development or evaluate those Open Source E-Commerce systems.

It will setup a virtual machine based on Oracle's VirtualBox including everything you need to run OXID CE or Magento CE.

### Available Vagrant Boxes
 * Ubuntu Precise 32
 * Ubuntu Precise 64

### Installation
 1. Install [Vagrant](http://www.vagrantup.com) & [VirtualBox](https://www.virtualbox.org)
 2. Clone this repository and update submodules (`git submodule init && git submodule update`)
 3. Execute the command `vagrant up` within a `vagrant/$box` folder
 4. That's it. It'll take some time when executing this command the first time. It'll download the Vagrant base box once and install all required packages.
 5. Don't forget to update your local hosts file. You have to add "apache.oxidce" as well as "apache.magece".

### Usage

Start your browser and open "http://apache.oxidce" or "http://apache.magece" after installation. You'll see the installation screen of the shop system.

### Installed Packages
 * PHP
 * PHP QA Tools (PHPUnit, PHPMD - PHP Mess Detector, PHP Depend, PHP CodeCoverage, PHP_CodeSniffer, ...)
 * Apache2
 * NGINX & PHP-FPM
 * MySQL
 * Percona-Toolkit
 * Subversion
 * Git
 * Composer

### Contributing

Let us know if you miss something. Feel free to open pull requests for further improving this package.

### Acknowledgements

A big thanks goes to the creators of the [Piwik Dev Environment](https://github.com/piwik/piwik-dev-environment) who inspired this package.
