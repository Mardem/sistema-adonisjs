const assert = require("assert")
const http = require("http")

require("dotenv").config()

const shouldBeOk = (method, path, done) => {
  http.request({
    host: process.env.HOST,
    port: process.env.PORT,
    method,
    path
  }, response => {
    assert.equal(200, response.statusCode)
    done()
  }).end()
}

const shouldHaveMessage = (method, path, message, done) => {
  http.request({
    host: process.env.HOST,
    port: process.env.PORT,
    method,
    path
  }, response => {
    let data = ""

    response.on("data", chunk => {
      data += chunk
    })

    response.on("end", () => {
      assert.equal(message, data)
      done()
    })
  }).end()
}

// Teste para forgot login
describe("GET /login", () => {
  it("verifica o status code (200)", done => {
    shouldBeOk('GET', '/login', done)
  })

  it("verifica se tem uma mensagem", done => {
    shouldHaveMessage('GET', '/login', 'GET /login', done)
  })
})

// Teste para forgot pass
describe("POST /forgot-password", () => {
  it("verifica o status code (200)", done => {
    shouldBeOk('GET', '/forgot-password', done)
  })

  it("verifica se tem uma mensagem", done => {
    shouldHaveMessage('GET', '/forgot-password', 'GET /forgot-password', done)
  })
})

// Teste para redefinição de senha com token
describe("GET /reset-password", () => {
  it("verifica o status code (200)", done => {
    shouldBeOk('GET', '/reset-password/token123', done)
  })
  it("verfica se tem uma mensagem", done => {
    shouldHaveMessage('GET', '/reset-password/token123', 'GET /reset-password/token123', done)
  })
})


// Teste para redefinição de senha com token (POST)
describe("POST /reset-password", () => {
  it("verifica o status code (200)", done => {
    shouldBeOk('POST', '/reset-password/token123', done)
  })
  it("verifica se tem uma mensagem", done => {
    shouldHaveMessage('POST', '/reset-password/token123', 'POST /reset-password/token123', done)
  })
})
