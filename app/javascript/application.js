import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "bootstrap-icons"

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-loading"

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
