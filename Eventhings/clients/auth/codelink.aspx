<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="codelink.aspx.cs" Inherits="Eventhings.clients.auth.codelink" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var user = JSON.parse(sessionStorage.getItem('user'));
        
        //if (user.role_name !== 'vendor' || user.role_name !== 'administrator') {
        //    alert(user.role_name);
        //    var currentPathName = window.location.href;
        //    window.location.replace("../login.html?redirect=" + currentPathName);
        //}

        if (user == null) {
            //alert(user.role_name);
            var currentPathName = window.location.href;
            window.location.replace("../login.html?redirect=" + currentPathName);
        }

        var codeText = new URLSearchParams(window.location.search).get('code');
        var roleName = user.role_name;

        if (roleName === 'vendor') {

            /*window.location.replace("../clients/auth/vendor-sales.aspx?code=" + codeText);*/
            window.location.replace("../auth/vendor-sales.aspx?code=" + codeText);
        }

        //if (roleName === 'administrator') {

        //    /*window.location.replace("../clients/auth/vendor-sales.aspx?code=" + codeText);*/
        //    window.location.replace("../auth/vendor-sales.aspx?code=" + codeText);
        //    return;
        //}

        if (roleName === 'customer') {

            /*window.location.replace("../clients/auth/vendor-sales.aspx?code=" + codeText);*/
            window.location.replace("../auth/vendor-sales.aspx?code=" + codeText);
        }
    </script>
</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
    <%--<section class="page-header" style="padding-top: 20px">
        <h2>Manage QR Codes</h2>
        <h5>Generate new QR codes, manage exisiting code by batch and date.</h5>
    </section>--%>
    <%--<section class="contact-content">
        <div class="contact-widget media">
            <img src="../assets/images/icon-4.png" alt="monitor" width="50">
            <div class="media-body">
                <h6 class="widget-title">New</h6>
                <p class="widget-content">Geneate new QR Code for an event</p>
            </div>
        </div>
        <div class="contact-widget media">
            <img src="../assets/images/icon-5.png" alt="Eventi.ng.-Book" width="40">
            <div class="media-body">
                <h6 class="widget-title">QR Code Text</h6>
                <p class="widget-content">Having issues with a customer QR code, deativate it here</p>
            </div>
        </div>
    </section>--%>
    <div class="row">
        <%--<div class="alert alert-info alert-dismissible" id="divAlert">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p id="lblErrorText"> </p>
        </div>--%>
        <div class="alert alert-info alert-dismissible" id="divAlert" style="display:none">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <p id="lblErrorText"></p>
                                </div>
    </div>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <section class="contact-form-wrapper">
        <form action="codelink.aspx" method="POST" id="frmQrcode" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-bs-toggle="tab" data-bs-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Map Code Text - Customer
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" style="display:none">
                        <button class="nav-link" id="mappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            Un-Map Code Text - Customer</button>
                    </li>
                    <li class="nav-item" role="presentation" style="display:none">
                        <button class="nav-link" id="unmappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Transaction History
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" style="display:none">
                        <button class="nav-link" id="printqrcode-tab" data-bs-toggle="tab" data-bs-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            E-Wallet
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Map a new QR Code to a new customer</p>
                            </section>
                            <div class="text-center">
                                <canvas id="customerQR"></canvas>
                            </div>
                            <div class="text-center mb-4">
                                <p class="form-footer-text" id="infotext"></p>
                                <span id="codeStatus" class="mb-4"></span>
                            </div>

                            <div class="form-group col-md-3" id="insert-batch-name">
                                <label for="txtBatchName">Customer - Phone <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtCustomerPhone" name="txtCustomerPhone" placeholder="">
                            </div>

                            <div class="form-group col-md-3" id="insert-batch-number">
                                <label for="txtCustomerFullName"> Customer Fullname <sup>*</sup></label>
                                <a href="account.aspx" class="batch-edit" onclick="javascript:void(0)"><span class="fa fa-user-edit"></span></a>
                                <input type="text" class="form-control" readonly="readonly" id="txtCustomerFullName" required="required" name="txtCustomerFullName" placeholder="">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtBatchName"> Event <sup>*</sup></label>
                                <select class="form-select form-select-lg" id="cmbEvents" name="cmbEvents">
                                    
                                </select>
                            </div>

                            
                            <div class="form-group col-md-3">
                                <label for="txtCodeCount">Point <sup>*</sup></label>
                                <a href="#" class="edit-point"><span class="fa fa-edit"></span></a>
                                <input type="number" min="1" max="50" class="form-control" id="txtTopUpAmount" value="0.00" name="txtTopUpAmount" placeholder="Base Point">
                            </div>

                             <div class="form-group col-md-12">
                                <label for="txtTopUpMoney">Current Balance <sup>*</sup></label>
                                <a href="#" class="edit-point disabled"><span class="fa fa-edit"></span></a>
                                <input type="number" min="1" max="50" class="form-control" id="txtTopUpMoney" value="0.00" name="txtTopUpMoney">
                            </div>

                            <div class="form-group col-md-4">
                                <input id="chkActive" name="chkActive" required="required" type="checkbox" value="" />
                                <label for="chkActive">Disable this user</label>
                            </div>

                            <div class="row">
                                <div class="text-right">
                                <button type="button" id="btnMapCustomerToCode" class="btn btn-lg btn-primary mb-4">Map Customer to code</button>
                            </div>
                            <div class="text-right">
                                <button type="button" id="btnTopUpWalet" class="btn btn-lg btn-primary mb-4">Proceed - Wallet Top Up</button>
                            </div>
                            <div class="text-right">
                                <button type="button" id="btnSales" class="btn btn-lg btn-primary mb-4">Proceed - Sales</button>
                            </div>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only map a single QR code text to a single user at a time.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                           Mapped QR code text are QR code text that has been mapped to any customer, choose default event if for eventi.ng.
                        </p>
                        <table class="table table-striped"  style="width:100%; max-height: 500px; " id="mappedQrcodeTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Code Text</th>
                                    <th scope="col">Date Mapped</th>
                                    <th scope="col">Event</th>
                                    <%--<th scope="col">Date</th>
                                    <th scope="col">Mapped</th>--%>
                                </tr>
                            </thead>
                            <tbody id="mappedtbody">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Un-mapped QR code text are QR code text that has not been mapped to any customer. Mapping can be done directly from within 
                            this tab or from the customer profile page.
                        </p>
                        <table class="table table-striped table-bordered"  style="width:100%; " id="unmappedTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Number</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Code Text</th>
                                    <th scope="col">Active</th>
                                    <th scope="col">Created Date</th>
                                    <th scope="col">Mapped</th>
                                </tr>
                            </thead>
                            <tbody id="unmappedtbody">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>Print QR Code Images From Store QR Code Text</p>
                        </section>
                        
                        <div class="row">
                            <div class="form-group col-md-6">
                                <select class="form-control" name="cmbGenBatchNames" id="cmbGenBatchNames" runat="server">
                                    <option value="1">New Bach Test</option>
                                    <option value="2">New Bach Test A</option>
                                    <option value="2">New Bach Test Z</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                    aria-expanded="false"> Choose an action
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <a class="dropdown-item" id="btnGenerateQrCodeImages" href="#">Generate QR Code Image</a>
                                    </li>
                                    <li><a class="dropdown-item" id="btnPrintSection" href="print.aspx">Print</a></li>
                                    <li><a class="dropdown-item" href="#">Extras</a></li>
                                </ul>
                            </div>
                            </div>
                        </div>

                        <div class="row" id="divQrCardBody">
                            
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </section>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        var user_id = '';
        function GetEvents() {

            $.ajax({
                type: "POST",
                url: "/Services/events.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                /*data: JSON.stringify(data),*/
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    $('#cmbEvents').empty();

                    if (responseData.length < 1) {

                        $('#cmbEvents').append($("<option></option>").val(0).html('No event available'));
                        $("#lblErrorText").html("No event is available, please add a new event");
                        return;
                    }

                    $.each(responseData, function (i, data) {

                        $('#cmbEvents').append($("<option></option>").val(data.id).html(data.name)); //+ ' | ' + 'Duratioin = ' + data.duration));

                    });
                },
                beforeSend: function () {
                    $('#cmbEvents').append($("<option>Loading events...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetMappedQrDetails(code) {

            var data = {
                code: code
            }

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetMappedQrCodeByCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    if (responseData == null || responseData.undefined) {

                        $("#divAlert").addClass("alert alert-danger alert-dismissible fade show").attr('display', false).slideDown("slow");
                        return;
                    }

                    //console.log(responseData);
                    $("#lblErrorText").html(responseData.Message);

                    console.log(responseData.event_name);
                    if (responseData.Status == '1') {

                        $('#codeStatus').html("<b>Status:</b> " + ((responseData.Status == '1') ? "Mapped." : "Not Mapped") + "<b> Date Mapped:</b> " + $.formattedDate(responseData.date_mapped) + ". <b> Event Name:</b> " + responseData.event_name);

                        //If code has been mapped
                        $('#txtCustomerFullName').val(responseData.full_name);
                        $('#txtCustomerFullName').attr('disabled', true);

                        $('#txtCustomerPhone').val(responseData.phone_number);
                        $('#txtCustomerPhone').attr('disabled', true);

                        $('#txtTopUpAmount').val(responseData.point);
                        $('#txtTopUpAmount').attr('disabled', true);

                        $('#txtTopUpMoney').val(responseData.current_balance);
                        $('#txtTopUpMoney').attr('disabled', true);

                        $('#chkActive').attr('disabled', true);
                        $('#btnMapCustomerToCode').hide();

                        $('#btnTopUpWalet').show();
                        $('#btnSales').show();
                        //$('#btnMapCustomerToCode').show();
                        //$('#btnMapCustomerToCode').attr('disabled', true);

                        //$("#divAlert").addClass("alert alert-success alert-dismissible fade show").attr('display', false).slideDown("slow");
                        return;

                    }

                    //if code has not been mapped
                    if (responseData.Status >= '2') {

                        $('#codeStatus').html("<b>Status:</b> " + ((responseData.Status == '1') ? "Mapped." : "Not Mapped") +
                            "<b> Date Mapped:</b> " + (responseData.date_mapped == undefined || responseData.date_mapped == null) ? " - " : $.formattedDate(responseData.date_mapped) + ". <b> Event Name:</b> " + responseData.event_name);


                        $('#txtCustomerFullName').attr('disabled', false);
                        $('#txtCustomerPhone').attr('disabled', false);
                        $('#txtTopUpAmount').attr('disabled', false);

                        $('#btnTopUpWalet').hide();
                        $('#btnSales').hide();
                        $('#btnMapCustomerToCode').attr('disabled', true);

                    }

                    if (responseData.Status == '0') {

                        $('#btnTopUpWalet').hide();
                        $('#btnSales').hide();
                        $('#btnMapCustomerToCode').hide();

                        $("#divAlert").addClass("alert alert-danger alert-dismissible fade show").attr('display', false).slideDown("slow");
                        return;
                    }

                },
                beforeSend: function () {
                    //$('#txtCustomerFullName').val("Loading customer names");
                    //$('#txtCustomerPhone').val("Loading customer phone");
                    //$('#txtTopUpAmount').val("Loading customer points");
                },
                error: function (data) {
                    $("#btnTopUpWalet").html("Error occured while submiting form");
                }
            });
        }

        function GetCustomer(phone) {
            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetCustomer",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ "phone_number": phone }),
                success: function (response) {
                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    var status = responseData.Status;
                    if (status >= '1') {

                        //txtCurrentBalance
                        user_id = responseData.id;
                        $('#txtCustomerFullName').val(responseData.last_name + " " + responseData.first_name);
                        $('#btnMapCustomerToCode').attr('disabled', false);
                    }
                    else if (status == '0') {
                        $("#divAlert").addClass("alert alert-danger alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);
                        return;
                    }
                },
                error: function (data) {
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function MapCodeToCustomer(map) {

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/MapCodeToCustomer",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(map),
                success: function (response) {
                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    var status = responseData.Status;
                    if (status >= '1') {

                        //txtCurrentBalance
                        user_id = responseData.id;
                        $("#divAlert").addClass("alert alert-success alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);
                    }
                    else if (status == '0') {
                        $("#divAlert").addClass("alert alert-danger alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);
                        //$('#btnMapCustomerToCode').attr('disabled', true);
                        return;
                    }
                },
                error: function (data) {
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        $(document).ready(function () {

            //redirectbyRole();

            //Hide the sales button
            $('#btnSales').hide();

            //toggle point edit onlick
            $('.edit-point').on('click', function (e) {

                if ($('#txtTopUpAmount').prop('disabled') == true) {

                    $('#txtTopUpAmount').attr('disabled', false).focus();

                } else {

                    $('#txtTopUpAmount').attr('disabled', true);
                }

            });

            $('label sup').css('color', 'red');

            if (window.location.search.indexOf('?') == -1) {

                $('#myTabContent0').hide();
                return;
            }

            //? code=cc7aa34a-4743-4cbb-af47-5c9927020862
            //check if the code is null or undefine
            //if null, disable the link code button

            //else check if code is mapped (check the codestore table)
            //if mapped, retireve the user detils
            //else retrieve all customer phone and autocomplete to phone control

            var codeAndValue = window.location.search.split('?')[1].trim();
            var codeValue = codeAndValue.split('=')[1];
            var codeText = codeAndValue.split('=')[0];
            if ((codeText == null || codeText == undefined) || (codeText != 'code')) {

                $('#myTabContent0').hide();
                return;
            }

            //display the qrcode text
            $('#infotext').text(codeValue);

            //Get a list of all available events
            GetEvents();


            //chekc if the qrcode has been apped
            //if mapped display the mapping details
            GetMappedQrDetails(codeValue);

            qr = new QRious({
                element: document.getElementById('customerQR'),
                size: 206,
                value: 'https://www.eventiix.com/clients/auth/codelink.aspx?code=' + codeValue,
                foreground: 'black'
            });


            $('#btnTopUpWalet').on('click', function () {

                window.location.replace("../auth/ewallet.aspx?phone=" + $("#txtCustomerPhone").val());

            });

            $('#btnSales').on('click', function () {

                window.location.replace("../auth/sales.aspx?phone=" + $("#txtCustomerPhone").val());
                sessionStorage.setItem('point', $("#txtTopUpAmount").val());
            });

            $('#btnMapCustomerToCode').on('click', function () {

                var map = {
                    user_id: user_id,
                    code: $("#infotext").text(),
                    event_id: $('#cmbEvents option:selected').val(),
                    payment_channel: "Initial Base Point",
                    base_point: $('#txtTopUpAmount').val(),
                    base_amount: $('#txtTopUpMoney').val(),
                }
                var data = {
                    map: map
                };

                MapCodeToCustomer(data);

            });

            $('#txtCustomerPhone').on('keypress', function (e) {

                if (e.which == 13) {
                    var code = window.location.search.split('=')[1];
                    var phone = $("#txtCustomerPhone").val();
                    if (phone.length < 1) {

                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("The customer phone number can be found");
                        return;

                    }

                    GetCustomer(phone);

                }
            })

        });


    </script>
</asp:Content>
