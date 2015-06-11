jQuery ->
  $('#new_product').fileupload
    dataType: 'script'
    add: (e, data) ->
      alert 'add'
      types = /(\.|\/)(gif|jpe?g|png|mov|mpeg|mpeg4|avi)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-product", file))
        $('#new_product').append(data.context)
        $('.actions input[type="submit"]').click (e) ->
          data.submit()
          e.preventDefault()
      else
        alert("#{file.name} is not a gif, jpg or png image file")
    progress: (e, data) ->
      alert 'progress'
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    done: (e, data) ->
      alert 'done'
      $('.actions input[type="submit"]').off('click')
