require("jquery")
require("datatables.net-bs4")
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "bootstrap"
import "../stylesheets/application"
import 'core-js/stable'
import 'regenerator-runtime/runtime'

import $ from 'jquery'
global.$ = jQuery;

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// This would 100% go in an appropriately organized file.
$(document).ready(function() {
    $('#table').DataTable( {
        paging: false,
        info: false,
        searching: false,
        "columns": [
          null,
          null,
          null,
          null,
          { "orderable" : false } // It would've been textual ordering not numeric - removed for now so its not seen as a bug
        ]
    } );
} );
