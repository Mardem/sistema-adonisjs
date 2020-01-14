'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.on('/').render('welcome')

Route.get('/login', () => {
  // show login form
  return 'GET /login'
})

Route.post('/login', () => {
  // create new customer session
  return 'POST /login'
})

Route.put('/logout', () => {
  // expire current customer session
  return 'PUT /logout'
})

Route.get('/register', () => {
  // show registration form
  return 'GET /register'
})

Route.get('/forgot-password', () => {
  // show forgot password form
  return 'GET /forgot-password'
})

Route.post('/forgot-password', () => {
  // create new password reset token and send e-mail
  return "POST /forgot-password"
})

Route.get('/reset-password/:token', ({ params }) => {
  // show forgot password form
  return "GET /reset-password/" + params.token
})

Route.post('/reset-password/:token', ({ params }) => {
  // create new password reset token and send e-mail
  return "POST /reset-password/" + params.
})

Route.get('/:customer', ({ params}) => {
  // show customer profile
  return "GET /:customer/" + params.customer
})

Route.put('/:customer', ({ params }) => {
  // update customer profile
  return "PUT /:customer/" + params.customer
})

Route.delete('/:customer', ({ params }) => {
  // delete a customer profile
  return "DELETE /:customer/" + params.customer
})

Route.get('/:customer/products', ({ params }) => {
  // show customer's products
  return "GET /:customer/products" + params.customer
})

Route.post('/:customer/products', ({ params }) => {
  // create a new product
  // Parado na página 33
})
