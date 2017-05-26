window.onload = function() {
  // 画像アップロード
  $('#submit_image').on('click', function(evt) {
    var form = $('#new_article_image').get()[0];
    var formData = new FormData( form );

    $.ajax({
      url: '/api/article_images',
      method: 'post',
      dataType: 'json',
      data: formData,
      processData: false,
      contentType: false
    }).done(function( res ) {
      var addedImage = "![" + res.alt + "]("+ res.image_url + ")";

      insertToEditor(addedImage);
    }).fail(function( jqXHR, textStatus, errorThrown ) {
      // しっぱい！
      console.log( 'ERROR', jqXHR, textStatus, errorThrown );
    });

    return false;
  });

  // インクリメンタルサーチ
  function incSearch(){
    clearTimeout(incSearch.timeid);
    incSearch.timeid = setTimeout(function(){
        var query = tgtInput.value;
        if(query.length == 0) return false;

        jQuery.ajax({
            type : 'GET',
            url : '/api/clinics/search',
            data : {
                q : query
            }
        });
    },500);

  };
  incSearch.timeid = "";

  var tgtInput = document.getElementById('clinic_search');
  tgtInput.onkeydown = incSearch;

  // クリニックデータ挿入
  $('#submit_clinic').on('click', function(evt) {
    var form = $('#clinic_data_form');

    $.ajax({
      url: '/api/clinics/insert',
      method: 'get',
      dataType: 'json',
      data: form.serialize(),
      processData: false,
      contentType: false
    }).done(function( res ) {
      var addedClinic = "[clinic:" + res.clinic_id + "," + res.clinic_name + "," + res.treatment_name + "," + res.treatment_price + "," + res.site_url + "]";

      insertToEditor(addedClinic);
    }).fail(function( jqXHR, textStatus, errorThrown ) {
      // しっぱい！
      console.log( 'ERROR', jqXHR, textStatus, errorThrown );
    });

    return false;
  });


  //カーソル位置にデーターを挿入する
  function insertToEditor(content){
    var markdownForm = $("#input_article_content");

    markdownForm.focus();
    if(navigator.userAgent.match(/MSIE/)) {
      var r = document.selection.createRange();
      r.text = content;
      r.select();
    } else {
      var s = markdownForm.val();
      var p = markdownForm.get(0).selectionStart;
      var np = p + content.length;
      markdownForm.val(s.substr(0, p) + content + s.substr(p));
      markdownForm.get(0).setSelectionRange(np, np);
    }
  }
};
