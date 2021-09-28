////function CallMethod(url, parameters, successCallback) {
////    //show loading... image

////    $.ajax({
////        type: 'POST',
////        url: url,
////        data: JSON.stringify(parameters),
////        contentType: 'application/json;',
////        dataType: 'json',
////        success: successCallback,
////        error: function (xhr, textStatus, errorThrown) {
////            console.log('error');
////        }
////    });
////}

////CallMethod(url, pars, onSuccess);

////function onSuccess(param) {
////    //remove loading... image
////    //do something with the response
////}

////function makeAjaxCall(url, reqtype, data, datatype, cache) {

////    $.ajax({
////        type: reqtype,
////        url: url,
////        dataType: datatype,
////        contentType: "application/json; charset=utf-8",
////        data: JSON.stringify(data),
////        cache: cache,
////        success: function (response) {

////            var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

////            return responseData;
////        },
////        error: function (err) {
////            return err;
////        }
////    });
////}