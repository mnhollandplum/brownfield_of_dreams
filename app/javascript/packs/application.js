import { Application } from 'stimulus'
import { autoload } from 'stumulus/webpack-helpers'

const application = Application.start()
const constrollers = require.context("./controllers", true, /\.js/ )
autoload(controllers, application)
