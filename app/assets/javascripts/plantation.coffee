# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#plantation_list').dataTable
    'fnDrawCallback': (oSettings) ->

      if oSettings.bSorted or oSettings.bFiltered
        i = 0
        iLen = oSettings.aiDisplay.length
        while i < iLen
          $('td:eq(0)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html i + 1
          i++
      return
    'aoColumnDefs': [ {
      'bSortable': false
      'aTargets': [ 0 ]
    } ]
    'aaSorting': [ [
      1
      'asc'
    ] ]
  return


