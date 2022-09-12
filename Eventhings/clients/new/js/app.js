function payWithPaystack(amount) {
    var handler = PaystackPop.setup({
        key: 'pk_test_4b786ee9cbf35a95169326bfca7f81b620fbe770',
        email: 'app@eventi.com.ng',
        amount: parseInt(amount) + "00",
        currency: "NGN",
        ref: '' + Math.floor((Math.random() * 1000000000) + 1),
        // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
        metadata: {
            custom_fields: [
                {
                    display_name: "Mobile Number",
                    variable_name: "mobile_number",
                    value: "+2348144488577"
                }
            ]
        },
        callback: function (response) {
            //alert('success. transaction ref is ' + response.reference);
            let tranxData = {
                amount: amount,
                status: 'Payed',
                ref: response.reference
            }
            sessionStorage.setItem('pay', JSON.stringify(tranxData));

            //update event payment table and send an email to customer
            let eventpaymentdto = {
                user_id: JSON.parse(sessionStorage.getItem('user')).user_id,
                event_id: sessionStorage.getItem('event_id'),
                tranx_ref_id: response.reference,
                amount: amount,
                created_by: sessionStorage.getItem('email'),
            }
            let data = {
                eventpaymentdto: eventpaymentdto
            }
            //$.post('/Services/events.asmx/SaveEventPayment', JSON.stringify(data), function (response) {
            //    // Log the response to the console
            //    console.log("Response: " + response);
            //});

            $.ajax({
                type: "POST",
                url: "/Services/events.asmx/SaveEventPayment",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    var status = responseData.Status;
                    console.log(status);
                    if (status >= '1') {
                        window.location.replace("transaction-success.html?ref=" + response.reference + "&status=paid&attempt=1&amount=" + amount);
                    }
                    else if (status == '0') {
                        alert(responseData.Message);
                    }
                },
                error: function (data) {
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                    /*console.error(data);*/
                }
            });
        },
        onClose: function (response) {
            alert("User terminated the transaction, transaction status 'Not Completed' transx ref:" + 0);
            //window.location.replace("transaction-success.html?ref=0&status=notpaid&attempt=0");
        }
    });
    handler.openIframe();
}

function GetEvents() {

    $.ajax({
        type: "POST",
        url: "/Services/events.asmx/Get",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        cache: false,
        success: function (response) {

            var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

            $('#eventTBody').empty();
            $.each(responseData, function (i, row) {
                let rowcard = `<div class="col-lg-4 col-md-6">
                                        <div data-anim="slide-up delay-1" class="h-1/1 is-in-view">
                                            <div class="d-flex direction-column py-30 px-30 h-1/1 bg-white rounded-8">

                                                <div class="flex-expand">
                                                    <div class="d-flex">
                                                        <div class="px-12 py-4 bg-accent text-white rounded-4">
                                                            <p id=${row.id} onclick="gotInvoice(${row.id})">Buy your ticket</p>
                                                        </div>
                                                    </div>

                                                    <div class="mt-20 lg:mt-20 md:mt-20">
                                                        <h4 class="text-2xl fw-600 lh-16"> ${row.name} </h4>
                                                        <p class="mt-16"> ${row.description} </p>
                                                        <hr/>
                                                        <div class="row items-center y-gap-10 x-gap-10 pb-24">
                                                            <div class="col-auto">
                                                                <a href="blog-single-1.html" class="decoration-none"> Venue - ${row.location} </a>
                                                            </div>
                                                            <hr/>
                                                            <div class="col-auto">
                                                                <a href="blog-single-1.html" class="decoration-none"> Date - ${(row.start_date != undefined) ? $.formattedDate(row.start_date) + " To " + $.formattedDate(row.end_date) : " - "} </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div>
                                                    <a href="#" class="button -simple text-accent fw-600 underline mt-20">view event details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>`;
                $('#eventcard').append(rowcard);
            });

            //$('#roleTable').DataTable();

        },
        beforeSend: function () {
            $('#cmbUserType').append($("<option>Loading hosts..</option>"));
        },
        error: function (data) {
            $("#lblErrorText").html("Error occured while submiting form");
        }
    });
}

function checkAllSale() {
    alert();
    var chk = $('#vendorSalesTable  checkbox');
    chk.attr('checked', true);
}

function LogOut() {

    sessionStorage.clear();
    localStorage.clear();
}

function parse_query_string(query) {
    var vars = query.split("&");
    var query_string = {};
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        var key = decodeURIComponent(pair[0]);
        var value = decodeURIComponent(pair[1]);
        // If first entry with this name
        if (typeof query_string[key] === "undefined") {
            query_string[key] = decodeURIComponent(value);
            // If second entry with this name
        } else if (typeof query_string[key] === "string") {
            var arr = [query_string[key], decodeURIComponent(value)];
            query_string[key] = arr;
            // If third or later entry with this name
        } else {
            query_string[key].push(decodeURIComponent(value));
        }
    }
    return query_string;
}

//var query_string = "a=1&b=3&c=m2-m3-m4-m5";
//var parsed_qs = parse_query_string(query_string);
//console.log(parsed_qs.c);

$.getVendorSalesReport = function () {

    var responseData = '';
    let vendorId = $("#cmbVendors option:selected").val();

    $.ajax({
        type: "POST",
        url: "/Services/sales.asmx/GetVendorSales",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({ "vendorid": ($("#cmbVendors option:selected").val() == '0' || $("#cmbVendors option:selected").val() == undefined) ? 0 : vendorId }),
        cache: false,
        success: function (response) {

            responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
            if (responseData.length < 1 || responseData[0].Status == '0') {

                $("#vendorSalesTBody").empty().append($('<tr><td colspan="5"> No sales data available for the selected vendor </td></tr>')/*.html("")*/);
                return;
            }

            if (responseData.length < 1 || responseData[0].Status == '-1') {

                $("#vendorSalesTBody").empty().append($('<p> </p>').html(responseData.Message));
                return;
            }

            $("#vendorSalesTBody").empty();
            $.each(responseData, function (i, sale) {
                let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="${'chkoption' +i}"/>
                                                </div>
                                            </td>
                                            <td>${i+1}</td>
                                            <td>${sale.vendor}</td> 
                                            <td>${(sale.last_tranx_date != undefined || sale.last_tranx_date == null) ? $.formattedDate(sale.last_tranx_date) : " - "}</td>
                                            <td>${sale.total_sales_amount}</td>
                                            <td>${sale.total_sales_point}</td>
                                        </tr>`;

                $('#vendorSalesTBody').append(rows);
            });
        },
        beforeSend: function () {
            $("#vendorSalesTBody").empty().prepend($('<p> </p>').html("Loading vendor sales data..."));
        },
        error: function (data) {
            $("#lblErrorText").html("An error occured when making the request.");
        }
    });

}

//Get all the endors by name and bind them to a select control
$.getVendors = function () {

    var responseData = '';
    $.ajax({
        type: "POST",
        url: "/Services/vendors.asmx/Get",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        /*data: JSON.stringify(data),*/
        cache: false,
        success: function (response) {

            responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
            if (responseData.length < 1) {

                $("#cmbVendors").empty();
                $('#cmbVendors').append($("<option></option>").val('0').html('-- No vendor available --'));
                return;
            }

            $("#cmbVendors").empty();
            $('#cmbVendors').append($("<option></option>").val('0').html('-- choose a vendor --'));
            $.each(responseData, function (i, vendor) {

                $('#cmbVendors').append($("<option></option>").val(vendor.id).html(vendor.first_name + ' ' + vendor.last_name));

            });
            
        },
        beforeSend: function () {
            //$('#cmbVendors').append($("<option>Loading vendors data...</option>"));
        },
        error: function (data) {
            $("#lblErrorText").html("An error occured when making the request.");
        }
    });

    return responseData;
}

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

//callmethod(url, pars, onsuccess);

function onsuccess(param) {
    //remove loading... image
    //do something with the response
}

function makeajaxcall(url, type, reqtype, data, datatype, cache) {

    $.ajax({
        type: type,
        url: url,
        dataType: datatype,
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        cache: cache,
        success: function (response) {

            var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

            return responseData;
        },
        error: function (err) {
            return err;
        }
    });
}

// returns the cookie with the given name,
// or undefined if not found
function getCookie(name) {
    let matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

function setCookie(name, value, options = {}) {

    options = {
        path: '/',
        // add other defaults here if necessary
        ...options
    };

    if (options.expires instanceof Date) {
        options.expires = options.expires.toUTCString();
    }

    let updatedCookie = encodeURIComponent(name) + "=" + encodeURIComponent(value);

    for (let optionKey in options) {
        updatedCookie += "; " + optionKey;
        let optionValue = options[optionKey];
        if (optionValue !== true) {
            updatedCookie += "=" + optionValue;
        }
    }

    document.cookie = updatedCookie;
}
// Example of use:
//setCookie('user', 'John', { secure: true, 'max-age': 3600 });

function deleteCookie(name) {
    setCookie(name, "", {
        'max-age': -1
    })
}