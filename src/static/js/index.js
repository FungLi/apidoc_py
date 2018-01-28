
var _init = {

  init: function() {
    this._initDocIframe()
    this._bandingNavEvent()
  },

  _initDocIframe: function() {
    var firstName = $('.item-project:eq(0)').data('projname');
    $('.doc-container iframe').attr('src', '/static/apidocs/'+ firstName +'/index.html')
  },

  _bandingNavEvent: function() {
    $('.item-project').on('click', function() {
      $('.doc-container iframe').attr('src', '/static/apidocs/'+ $(this).data('projname') +'/index.html')
    });
  }
}

$(document).ready(function(){_init.init()})

