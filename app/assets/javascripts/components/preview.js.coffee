$ ->
  previewImage = ->
    image_input = document.querySelector '.mount-image input'
    image_input.addEventListener 'change', ->
      image_file = @.files[0]
      type = image_file.type
      if !type.match(/^image\/(png|jpeg|jpg)$/)
        alert '画像ファイルを選択してください。'
        $(@).replaceWith($(@).clone())
        unless $(@).next().attr('value')
          $(@).prev().attr('src', '')
        previewImage()
        return
      reader = new FileReader
      reader.readAsDataURL(image_file)
      reader.onload = =>
        $(@).prev().attr('src', reader.result)
  previewImage()
