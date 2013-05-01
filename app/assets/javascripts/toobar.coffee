# ProductsController 下所有页面的 JS 功能
window.Products =

# 往话题编辑器里面插入图片代码
  appendImageFromUpload : (srcs) ->
    txtBox = $(".product_editor")
    console.log(srcs)
    caret_pos = txtBox.caretPos()
    src_merged = ""
    for src in srcs
      src_merged = "![](#{src})\n"
    source = txtBox.val()
    before_text = source.slice(0, caret_pos)
    txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
    txtBox.caretPos(caret_pos+src_merged.length)
    txtBox.focus()

# 上传图片
  initUploader : () ->
    $("#product_add_image").bind "click", () ->
      $("#product_upload_images").click()
      return false
    opts =
      url : "/cpanel/images"
      type : "POST"
      beforeSend : () ->
        $("#product_add_image").hide()
        $("#product_add_image").before("<span class='loading'>上传中...</span>")
      success : (result, status, xhr) ->
        $("#product_add_image").parent().find("span").remove()
        $("#product_add_image").show()
        Products.appendImageFromUpload([result])

    $("#product_upload_images").fileUpload opts
    return false