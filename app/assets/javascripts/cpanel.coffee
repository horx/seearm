#= require jquery
#= require jquery_ujs
#= require jquery-fileupload/basic
#= require twitter/bootstrap/transition
#= require twitter/bootstrap/alert
#= require twitter/bootstrap/modal
#= require twitter/bootstrap/dropdown
#= require twitter/bootstrap/tab
#= require twitter/bootstrap/tooltip
#= require twitter/bootstrap/button
#= require will_paginate
#= require_self
$ ->
  body = $("body")

  $(".fileupload").each ->
    $(this).fileupload
      dataType: "json"
      dropZone: $(this).closest(".uploadable-input") # #206 http://git.io/DuKo8A
      add: (e, data) ->
        el = $(this).parent()
        el.hide()
        el.next(".uploading").show()
        data.submit()

      done: (e, data) ->
        $.each data.result.files, (index, file) ->
          targetTextarea = $(e.target).closest(".control-group").find("textarea")
          markdownImage = "![" + file.name + "](" + file.url + ")"
          markdownImage = "\n" + markdownImage + "\n"  unless targetTextarea.val() is ""
          targetTextarea.insertAtCursor markdownImage

        el = $(this).parent()
        el.show()
        el.next(".uploading").hide()


  $("textarea.uploadable").on("focus", ->
    $(this).next("p").addClass "focused"
  ).on "blur", ->
    $(this).next("p").removeClass "focused"



  $(".uploadable-input").each ->
    $this = $(this)

    #get textarea's id
    id = $this.find('textarea').attr('id')

    #set write-tab's link
    writeTab = $this.find('.write-tab:first a')
    writeTab.attr('href', '#'+id)

    #set preview-tab's link
    previewTabId = id + '_preview_bucket'
    previewTab = $this.find('.preview-tab')
    previewTab.find('a').attr('href', '#'+previewTabId)

    #set write-section's id
    writeSec = $this.find('.tab-content>.active')
    writeSec.attr('id',id)
    #set preview-section's id
    previewSec = writeSec.siblings()
    previewSec.attr('id',previewTabId)

    #preview content in the write section
    previewTab.click ->
      writeBits = writeSec.find('textarea').val()
      previewSec.find('.previews').empty()
      if writeBits is ''
        previewSec.find('.preview-nothing').show()
      else
        $.ajax({
               url: "/content/preview"
               type: "POST"
               data: "content="+writeBits
               beforeSend: ->
                 previewSec.find('.preview-nothing').hide()
                 previewSec.find('.preview-loading').show()
               success: (data) ->
                 previewSec.find('.preview-loading').hide()
                 previewSec.find('.previews').append(data.result)
               })



  $('[rel=popover]').each ->
    options = {}
    $this = $(this)
    if $this.data('target')
      $target = $($this.data('target'))
      options = {
      html: true
      title: $target.find('.popover-title').html()
      content: $target.find('.popover-content').html()
      }

    $this.popover(options)

  $("a[data-toggle='tooltip']").tooltip()