//= require jquery
//= require rails-ujs
//= require jquery_ujs
//= require activestorage
//= require turbolinks

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
