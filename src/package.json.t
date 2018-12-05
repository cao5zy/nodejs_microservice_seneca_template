{
  "name": "{{ deployConfig.instanceName }}",
  "version": "1.0.0",
  "description": "{{ deployConfig.instanceName }}",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
      "{{ deployConfig.instanceName }}"
   ],
  "author": "{{ deployConfig.instanceName }}",
  "license": "ISC",
  "dependencies": {
     "log4js": "^2.5.3",
     "mongo-client-connect": "^1.0.6",
     "seneca": "^3.4.3"
  },
  "engines": {
     "node": ">=6.10.3"
  }
}