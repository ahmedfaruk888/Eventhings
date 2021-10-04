$.formattedDate = function (dateToFormat) {

    dateToFormat = new Date(parseInt(dateToFormat.replace("/Date(", "").replace(")/", ""), 10)).toDateString(); //.toLocaleDateString();

    //var dateObject = new Date(dateToFormat);
    //var day = dateObject.getDate();
    //var month = dateObject.getMonth() + 1;
    //var year = dateObject.getFullYear();
    //day = day < 10 ? "0" + day : day;
    //month = month < 10 ? "0" + month : month;
    //var formattedDate = day + "/" + month + "/" + year;
    /*return formattedDate;*/
    return dateToFormat;
};

function callmethod(url, parameters, successcallback) {
    //show loading... image

    $.ajax({
        type: 'post',
        url: url,
        data: json.stringify(parameters),
        contenttype: 'application/json;',
        datatype: 'json',
        success: successcallback,
        error: function (xhr, textstatus, errorthrown) {
            console.log('error');
        }
    });
}

//callmethod(url, pars, onsuccess);

function onsuccess(param) {
    //remove loading... image
    //do something with the response
}

function makeajaxcall(url, reqtype, data, datatype, cache) {

    $.ajax({
        type: reqtype,
        url: url,
        datatype: datatype,
        contenttype: "application/json; charset=utf-8",
        data: json.stringify(data),
        cache: cache,
        success: function (response) {

            var responsedata = (response.d !== null || response.d !== undefined) ? response.d : response;

            return responsedata;
        },
        error: function (err) {
            return err;
        }
    });
}