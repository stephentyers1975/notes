# Node commands
## install node
`curl -sL https://rpm.nodesource.com/setup_13.x | bash -`  

`yum install nodejs`
## node version
`node -v`
## run node program
`node app.js`
## node execute command
`node -e "console.log(module.paths)"`
# npm commands
## npm version
`npm -v`
## npm search for package
`npm search package`
## npm install packages
`npm install package`
## npm global install
`npm install package -g`
# Application dependencies
## example
{
"name": "example-contentful-theExampleApp-js", "version": "0.0.0",
"private": true,  
"dependencies": {
"body-parser": "^1.18.2", "contentful": "^6.0.0", "cookie-parser": "~1.4.3", "dotenv": "^5.0.0", "execa": "^0.9.0", "express": "^4.16.2", "helmet": "^3.11.0", "lodash": "^4.17.5", "marked": "^0.3.16", "morgan": "^1.9.1", "pug": "~2.0.0-beta6"
} }
## run with npm and specific script from package.json
`npm run start:dev`
## node process managers for running in production
- supervisord
- forever
- pm2
## start with pm2 examples
`pm2 start app.js`
`pm2 start app.js –i 4`
