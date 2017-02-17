const faker = require('faker');
const uuid = require('uuid-v4');
const jsonServer = require('json-server');
const devDb = require('./dev-db');

const middlewares = jsonServer.defaults();
const router = jsonServer.router(devDb());

// Returns an Express server
const server = jsonServer.create();
server.use(middlewares);
server.use(jsonServer.defaults());
server.use(jsonServer.bodyParser);

server.post('/transactions', (req, res, next) => {
    const id = uuid();
    const createdAt = (new Date()).getTime();
    req.body.id = id;
    req.body.created_at = createdAt;

  next();
});

server.use(router);
console.log('Listening at 4000')
server.listen(4000)
