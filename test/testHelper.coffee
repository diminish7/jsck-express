process.env.NODE_ENV = 'test'

expect = require('chai').expect

rootDir = path.join(__dirname, '..', 'src')

requireFromRoot = (resource) ->
  require path.join(rootDir, resource)

module.exports =
  expect:          expect
  rootDir:         rootDir
  requireFromRoot: requireFromRoot